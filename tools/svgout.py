import struct, collections
from shp import *
from swfmodel import *
GID=[0]
def clamp(v): return max(0,min(255,int(round(v))))
def col(c,cx,hair):
    r,g,b,a=c
    if cx:
        mul,add=cx
        r=clamp(r*mul[0]/256+add[0]);g=clamp(g*mul[1]/256+add[1]);b=clamp(b*mul[2]/256+add[2]);a=clamp(a*mul[3]/256+add[3])
    return r,g,b,a
def hexc(c): return '#%02x%02x%02x'%c[:3]
def shape_svg(cid,cx=None,hair=False,defs=None):
    """returns svg fragment string (no wrapper); defs list gets gradient defs"""
    try: fills,lines,edges=SHAPE_CACHE[cid]
    except KeyError:
        fills,lines,edges=SHAPE_CACHE[cid]=parse_shape(cid)
    out=[]
    byfill=collections.defaultdict(list)
    for f0,f1,l,seg in edges:
        if f0 is not None: byfill[f0].append(rev(seg))
        if f1 is not None: byfill[f1].append(seg)
    for fi in sorted(byfill):
        fs=fills[fi]; d=pathd(stitch(byfill[fi]))
        if fs[0]=='solid':
            c=col(fs[1],cx,hair)
            a='' if c[3]==255 else ' fill-opacity="%.3f"'%(c[3]/255)
            if hair: out.append('<path class="hc" d="%s"%s/>'%(d,a))
            else: out.append('<path fill="%s"%s d="%s"/>'%(hexc(c),a,d))
        elif fs[0] in('lin','rad'):
            if hair:
                st=fs[2]; c=col(st[len(st)//2][1],cx,hair) if st else (0,0,0,255)
                a='' if c[3]==255 else ' fill-opacity="%.3f"'%(c[3]/255)
                out.append('<path class="hc" d="%s"%s/>'%(d,a)); continue
            GID[0]+=1; gid='g%d'%GID[0]; m=fs[1]
            stops=''.join('<stop offset="%.3f" stop-color="%s"%s/>'%(ra/255,hexc(col(c,cx,hair)),'' if col(c,cx,hair)[3]==255 else ' stop-opacity="%.3f"'%(col(c,cx,hair)[3]/255)) for ra,c in fs[2])
            tr='matrix(%.6f %.6f %.6f %.6f %d %d)'%(m[0],m[1],m[2],m[3],m[4],m[5])
            if fs[0]=='lin': defs.append('<linearGradient id="%s" gradientUnits="userSpaceOnUse" x1="-16384" y1="0" x2="16384" y2="0" gradientTransform="%s">%s</linearGradient>'%(gid,tr,stops))
            else: defs.append('<radialGradient id="%s" gradientUnits="userSpaceOnUse" cx="0" cy="0" r="16384" fx="%d" fy="0" gradientTransform="%s">%s</radialGradient>'%(gid,int(fs[3]*16384),tr,stops))
            out.append('<path fill="url(#%s)" d="%s"/>'%(gid,d))
        else: out.append('<path fill="#808080" fill-opacity=".3" d="%s"/>'%d)
    bylin=collections.defaultdict(list)
    for f0,f1,l,seg in edges:
        if l is not None: bylin[l].append(seg)
    for li in sorted(bylin):
        w,c=lines[li]; c=col(c,cx,hair)
        sg=bylin[li]; parts=[]; cur=None
        for s in sg:
            if cur is None or (s[0],s[1])!=cur: parts.append('M%d %d'%(s[0],s[1]))
            parts.append(segstr(s,False)); cur=(s[4],s[5])
        a='' if c[3]==255 else ' stroke-opacity="%.3f"'%(c[3]/255)
        cl='class="hs"' if hair else 'stroke="%s"'%hexc(c)
        out.append('<path fill="none" %s%s stroke-width="%d" stroke-linecap="round" stroke-linejoin="round" d="%s"/>'%(cl,a,max(w,20),''.join(parts)))
    return ''.join(out)
SHAPE_CACHE={}
def cxcombine(a,b):
    if not a: return b
    if not b: return a
    ma,aa=a; mb,ab=b
    return ([ma[i]*mb[i]/256 for i in range(4)],[aa[i]*mb[i]/256+ab[i] for i in range(4)])
def mx(m): return 'matrix(%.5f %.5f %.5f %.5f %d %d)'%(m[0],m[1],m[2],m[3],m[4],m[5])
STAT=collections.Counter()
def render(cid,frame,defs,cx=None,hair=False,skip=(),overrides=None,depth=0,hairnames=('HairColor',)):
    """returns svg string of character cid at 1-based frame"""
    c,pos,ln=tagsById[cid]
    if c!=39: return shape_svg(cid,cx,hair,defs) if c in(2,22,32,83) else ''
    fr,_=sprite_tl(cid)
    if not fr: return ''
    f=fr[min(max(frame,1),len(fr))-1]
    out=[]
    for dp,o in sorted(f.items()):
        if 'id' not in o: continue
        if 'clip' in o: STAT['clip']+=1
        nm=o.get('name')
        if nm in skip:
            m=o.get('m'); out.append('<g class="e2"%s></g>'%((' transform="%s"'%mx(m)) if m else '')); continue
        ocx=cxcombine(cx,o.get('cx')) if not hair else None
        ih=hair or (nm in hairnames and depth<=1)
        sub_frame=1
        if overrides and nm in overrides: sub_frame=overrides[nm]
        tc=tagsById[o['id']][0]
        inner=render(o['id'],sub_frame,defs,ocx,ih,(),None,depth+1)
        if not inner: continue
        m=o.get('m')
        if tc==39 and tagsById[o['id']][0]==39 and False: pass
        if m and tuple(m)!=(1.0,0.0,0.0,1.0,0,0): out.append('<g transform="%s">%s</g>'%(mx(m),inner))
        else: out.append(inner if tc!=39 else '<g>%s</g>'%inner)
    return ''.join(out)
if __name__=='__main__':
    d=[]
    s=render(exports['Hats'],3,d)
    print(len(s),len(d)); print(s[:600])
