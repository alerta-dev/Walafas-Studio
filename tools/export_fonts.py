import struct, json
from swfmodel import *
from swfparse import Bits, rect
names={v:k for k,v in exports.items()}
def glyph_path(d,pos,end):
    b=Bits(d,pos); fb=b.ub(4); lb=b.ub(4); x=y=0; out=[]; first=True
    while True:
        if b.ub(1)==0:
            fl=b.ub(5)
            if fl==0: break
            if fl&1:
                n=b.ub(5); x=b.sb(n); y=b.sb(n)
                if not first: out.append('Z')
                out.append('M%d %d'%(x,y)); first=False
            if fl&2: b.ub(fb)
            if fl&4: b.ub(fb)
            if fl&8: b.ub(lb)
            if fl&16: break
        else:
            if b.ub(1):
                n=b.ub(4)+2
                if b.ub(1): dx=b.sb(n);dy=b.sb(n)
                elif b.ub(1): dx=0;dy=b.sb(n)
                else: dx=b.sb(n);dy=0
                x+=dx;y+=dy; out.append('L%d %d'%(x,y))
            else:
                n=b.ub(4)+2; cx=b.sb(n);cy=b.sb(n);ax=b.sb(n);ay=b.sb(n)
                out.append('Q%d %d %d %d'%(x+cx,y+cy,x+cx+ax,y+cy+ay)); x+=cx+ax;y+=cy+ay
    if not first: out.append('Z')
    return ''.join(out)
fonts={}
for c,pos,ln in T:
    if c!=75: continue
    d=body[pos:pos+ln]; fid=struct.unpack_from('<H',d,0)[0]; fl=d[2]; q=4
    nl=d[q]; q+=1; name=d[q:q+nl].decode('latin1').strip('\0'); q+=nl
    ng=struct.unpack_from('<H',d,q)[0]; q+=2; wide=fl&8; wcodes=fl&4
    base=q; sz=4 if wide else 2
    offs=[struct.unpack_from('<I' if wide else '<H',d,base+i*sz)[0] for i in range(ng)]
    cto=struct.unpack_from('<I' if wide else '<H',d,base+ng*sz)[0]
    ct=base+cto; codes=[struct.unpack_from('<H',d,ct+i*2)[0] if True else 0 for i in range(ng)]
    q=ct+ng*2
    if fl&0x80:
        asc,desc,lead=struct.unpack_from('<hhh',d,q); q+=6
        adv=[struct.unpack_from('<h',d,q+i*2)[0] for i in range(ng)]
    else:
        asc,desc=16000,4000; adv=[11000]*ng
    gl={}
    for i in range(ng):
        code=codes[i]
        if 32<=code<=0x17F:
            gl[code]={'a':adv[i],'d':glyph_path(d,base+offs[i],0)}
    fonts[fid]={'name':name,'asc':asc,'desc':desc,'glyphs':gl,'total':ng}
    print(fid,names.get(fid),repr(name),'glyphs',ng,'latin kept',len(gl),'flags',bin(fl),'has ñ',241 in gl,'has ¿',191 in gl,'asc',asc,'desc',desc)
json.dump({names.get(k,str(k)):v for k,v in fonts.items()},open('out/fonts.json','w'),separators=(',',':'))
import os; print(os.path.getsize('out/fonts.json')//1024,'KB')
