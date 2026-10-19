import struct, collections
from swfparse import *
ver,body=load(__import__('os').environ.get('SWF','Creador_De_Walfas_Walfas_Creator.swf'))
r,fps,fc,p=header(body)
T=tags(body,p)
def cs(b,pos):
    e=b.index(b'\0',pos); return b[pos:e].decode('utf8','replace'),e+1
def matrix(b):
    b.align(); sx=sy=1.0; r0=r1=0.0
    if b.ub(1): n=b.ub(5); sx=b.sb(n)/65536; sy=b.sb(n)/65536
    if b.ub(1): n=b.ub(5); r0=b.sb(n)/65536; r1=b.sb(n)/65536
    n=b.ub(5); tx=b.sb(n); ty=b.sb(n); b.align()
    return (sx,r0,r1,sy,tx,ty)   # a b c d tx ty  (a=sx,b=rs0,c=rs1,d=sy)
def cxform(b,alpha):
    b.align(); has_add=b.ub(1); has_mul=b.ub(1); n=b.ub(4)
    mul=[256,256,256,256]; add=[0,0,0,0]
    if has_mul:
        for i in range(4 if alpha else 3): mul[i]=b.sb(n)
    if has_add:
        for i in range(4 if alpha else 3): add[i]=b.sb(n)
    b.align(); return (mul,add)
def parse_place2(data):
    f=data[0]; depth=struct.unpack_from('<H',data,1)[0]; pos=3
    o={'depth':depth,'move':bool(f&1)}
    if f&2: o['id']=struct.unpack_from('<H',data,pos)[0]; pos+=2
    b=Bits(data,pos)
    if f&4: o['m']=matrix(b)
    if f&8: o['cx']=cxform(b,True)
    pos=b.p
    if f&16: o['ratio']=struct.unpack_from('<H',data,pos)[0]; pos+=2
    if f&32: o['name'],pos=cs(data,pos)
    if f&64: o['clip']=struct.unpack_from('<H',data,pos)[0]; pos+=2
    return o
def parse_timeline(tl):
    """tl: list of (code,pos,ln). returns frames: list of dict depth->obj, labels"""
    frames=[]; dl={}; labels={}; 
    for c,pos,ln in tl:
        d=body[pos:pos+ln]
        if c==26:
            o=parse_place2(d); dp=o['depth']
            if o['move'] and dp in dl:
                cur=dict(dl[dp]); 
                for k,v in o.items():
                    if k not in('depth','move'): cur[k]=v
                dl[dp]=cur
            else: dl[dp]={k:v for k,v in o.items() if k!='move'}
        elif c==4:  # PlaceObject
            cid,dp=struct.unpack_from('<HH',d,0); b=Bits(d,4); m=matrix(b)
            dl[dp]={'id':cid,'m':m,'depth':dp}
        elif c==5: 
            cid,dp=struct.unpack_from('<HH',d,0); dl.pop(dp,None)
        elif c==28: dl.pop(struct.unpack_from('<H',d,0)[0],None)
        elif c==43: labels[cs(d,0)[0]]=len(frames)+1
        elif c==1: frames.append({k:dict(v) for k,v in dl.items()})
        elif c==12: frames.append  # ignore actions here
    return frames,labels
tagsById={}
sprites={}
for c,pos,ln in T:
    if c in (2,22,32,83,46,84,39,11,33,37,14,6,20,21,35,36,48,75,10,7,34,60): 
        cid=struct.unpack_from('<H',body,pos)[0]
        tagsById[cid]=(c,pos,ln)
exports={}
for c,pos,ln in T:
    if c==56:
        cnt=struct.unpack_from('<H',body,pos)[0]; q=pos+2
        for _ in range(cnt):
            cid=struct.unpack_from('<H',body,q)[0]; s,q=cs(body,q+2); exports[s]=cid
def sprite_tl(cid):
    if cid in sprites: return sprites[cid]
    c,pos,ln=tagsById[cid]; assert c==39
    sid,fcount=struct.unpack_from('<HH',body,pos); q=pos+4; end=pos+ln
    tl=[]
    while q<end:
        h=struct.unpack_from('<H',body,q)[0]; q+=2; code=h>>6; l=h&63
        if l==63: l=struct.unpack_from('<I',body,q)[0]; q+=4
        if code==0: break
        tl.append((code,q,l)); q+=l
    res=parse_timeline(tl); sprites[cid]=res; return res
if __name__=='__main__':
    def dump(cid,ind=0,maxd=3,name=''):
        c,pos,ln=tagsById[cid]; tn=TAGNAMES.get(c,c)
        if c!=39: print('  '*ind+f'{name}:{cid} {tn}'); return
        fr,lab=sprite_tl(cid)
        print('  '*ind+f'{name}:{cid} Sprite frames={len(fr)} labels={list(lab)[:6]}')
        if ind>=maxd: return
        seen=set()
        for fi,f in enumerate(fr):
            for dp,o in sorted(f.items()):
                key=(dp,o.get('id'),o.get('name'))
                if key in seen: continue
                seen.add(key)
                if 'id' in o: dump(o['id'],ind+1,maxd,'%s@d%d f%d'%(o.get('name',''),dp,fi+1))
            if fi>3 and len(fr)>10: break
    import sys
    for n in sys.argv[1:]:
        print('#',n); dump(exports[n],0,2,n)
