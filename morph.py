import struct
from swfparse import Bits, rect
from swfmodel import body, matrix, tagsById
from shp import u16
def rgba(b): return (b.ub(8),b.ub(8),b.ub(8),b.ub(8))
def lerp(a,b,t): return a+(b-a)*t
def lc(c0,c1,t): return tuple(int(round(lerp(c0[i],c1[i],t))) for i in range(4))
def rec_loop(b,fb,lb):
    x=y=0;f0=f1=ln=0;edges=[]
    while True:
        if b.ub(1)==0:
            fl=b.ub(5)
            if fl==0: break
            if fl&1: n=b.ub(5); x=b.sb(n); y=b.sb(n)
            if fl&2: f0=b.ub(fb)
            if fl&4: f1=b.ub(fb)
            if fl&8: ln=b.ub(lb)
            if fl&16: break
        else:
            if b.ub(1):
                n=b.ub(4)+2
                if b.ub(1): dx=b.sb(n);dy=b.sb(n)
                elif b.ub(1): dx=0;dy=b.sb(n)
                else: dx=b.sb(n);dy=0
                seg=(x,y,None,None,x+dx,y+dy); x+=dx;y+=dy
            else:
                n=b.ub(4)+2; cx=b.sb(n);cy=b.sb(n);ax=b.sb(n);ay=b.sb(n)
                seg=(x,y,x+cx,y+cy,x+cx+ax,y+cy+ay); x=seg[4];y=seg[5]
            edges.append(((f0-1) if f0 else None,(f1-1) if f1 else None,(ln-1) if ln else None,seg))
    return edges
def parse_morph(cid,ratio):
    t=ratio/65535.0; c,pos,ln=tagsById[cid]; d=body; m2=(c==84)
    _,q=rect(d,pos+2); _,q=rect(d,q)
    if m2: _,q=rect(d,q); _,q=rect(d,q); q+=1
    off=struct.unpack_from('<I',d,q)[0]; q+=4; endpos=q+off
    b=Bits(d,q)
    n=b.ub(8); n=u16(b) if n==255 else n; fills=[]
    for _ in range(n):
        ty=b.ub(8)
        if ty==0: c0=rgba(b); c1=rgba(b); fills.append(('solid',lc(c0,c1,t)))
        elif ty in(0x10,0x12,0x13):
            m0=matrix(b); m1=matrix(b); b.align(); k=b.ub(8); st=[]
            for _ in range(k):
                r0=b.ub(8); c0=rgba(b); r1=b.ub(8); c1=rgba(b); st.append((int(lerp(r0,r1,t)),lc(c0,c1,t)))
            mm=tuple(lerp(m0[i],m1[i],t) for i in range(6))
            fills.append(('lin' if ty==0x10 else 'rad',mm,st,0))
        elif ty>=0x40: u16(b); matrix(b); matrix(b); b.align(); fills.append(('bitmap',))
    n=b.ub(8); n=u16(b) if n==255 else n; lines=[]
    for _ in range(n):
        w0=u16(b); w1=u16(b)
        if m2:
            b.ub(2);j=b.ub(2);hf=b.ub(1);b.ub(1);b.ub(1);b.ub(1);b.ub(5);b.ub(1);b.ub(2)
            if j==2: u16(b)
            if hf:
                ty=b.ub(8); 
                if ty==0: c0=rgba(b);c1=rgba(b)
                else: raise Exception('morph2 gradient line')
                lines.append((int(lerp(w0,w1,t)),lc(c0,c1,t))); continue
        c0=rgba(b); c1=rgba(b); lines.append((int(lerp(w0,w1,t)),lc(c0,c1,t)))
    fb=b.ub(4); lb=b.ub(4); se=rec_loop(b,fb,lb)
    b2=Bits(d,endpos); fb2=b2.ub(4); lb2=b2.ub(4); ee=rec_loop(b2,fb2,lb2)
    edges=[]
    for (f0,f1,l,s),(_,_,_,e) in zip(se,ee):
        def ctl(g): return g[2:4] if g[2] is not None else ((g[0]+g[4])/2,(g[1]+g[5])/2)
        if s[2] is None and e[2] is None: cx=cy=None
        else: (a,bq),(a2,b2_)=ctl(s),ctl(e); cx=lerp(a,a2,t); cy=lerp(bq,b2_,t)
        seg=(int(lerp(s[0],e[0],t)),int(lerp(s[1],e[1],t)),None if cx is None else int(cx),None if cy is None else int(cy),int(lerp(s[4],e[4],t)),int(lerp(s[5],e[5],t)))
        edges.append((f0,f1,l,seg))
    return fills,lines,edges
