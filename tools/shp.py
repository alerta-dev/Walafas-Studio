import struct
from swfparse import Bits
from swfmodel import body, matrix, tagsById, cs
def u16(b):
    lo=b.ub(8); return lo|(b.ub(8)<<8)
def rgb(b,alpha):
    r,g,bl=b.ub(8),b.ub(8),b.ub(8); a=b.ub(8) if alpha else 255; return (r,g,bl,a)
def fillstyle(b,alpha):
    t=b.ub(8)
    if t==0: return ('solid',rgb(b,alpha))
    if t in(0x10,0x12,0x13):
        m=matrix(b); b.align(); fl=b.ub(8); n=fl&15; stops=[]
        for _ in range(n):
            ra=b.ub(8); stops.append((ra,rgb(b,alpha)))
        foc=0
        if t==0x13: foc=b.sb(16)/256
        return ('lin' if t==0x10 else 'rad',m,stops,foc)
    if t>=0x40:
        u16(b); matrix(b); b.align(); return ('bitmap',)
    raise Exception('fill %x'%t)
def parse_shape(cid):
    c,pos,ln=tagsById[cid]; d=body
    q=pos+2
    from swfparse import rect
    _,q=rect(d,q)
    alpha=c in(32,83); s4=(c==83)
    if s4: _,q=rect(d,q); q+=1
    b=Bits(d,q)
    def readfills():
        n=b.ub(8)
        if n==255: n=u16(b)
        return [fillstyle(b,alpha) for _ in range(n)]
    def readlines():
        n=b.ub(8)
        if n==255: n=u16(b)
        out=[]
        for _ in range(n):
            w=u16(b)
            if s4:
                b.ub(2);j=b.ub(2);hf=b.ub(1);b.ub(1);b.ub(1);b.ub(1);b.ub(5);b.ub(1);b.ub(2)
                if j==2: u16(b)
                if hf: f=fillstyle(b,alpha); col=f[1] if f[0]=='solid' else (f[2][0][1] if f[0] in('lin','rad') else (0,0,0,255))
                else: col=rgb(b,alpha)
            else: col=rgb(b,alpha)
            out.append((w,col))
        return out
    fills=readfills(); lines=readlines()
    fb=b.ub(4); lb=b.ub(4)
    allf=list(fills); alll=list(lines); foff=0; loff=0
    x=y=0; f0=f1=ln_=0
    edges=[]  # (fillkey0,fillkey1,linekey,seg)
    while True:
        if b.ub(1)==0:
            fl=b.ub(5)
            if fl==0: break
            if fl&1:
                n=b.ub(5); x=b.sb(n); y=b.sb(n)
            if fl&2: f0=b.ub(fb)
            if fl&4: f1=b.ub(fb)
            if fl&8: ln_=b.ub(lb)
            if fl&16:
                b.align(); fills=readfills(); lines=readlines()
                foff=len(allf); loff=len(alll); allf+=fills; alll+=lines
                fb=b.ub(4); lb=b.ub(4)
                # style indices now relative to new offset; reset
                # (indices read after this are relative)
            # map indices
        else:
            if b.ub(1):
                n=b.ub(4)+2
                if b.ub(1): dx=b.sb(n);dy=b.sb(n)
                elif b.ub(1): dx=0;dy=b.sb(n)
                else: dx=b.sb(n);dy=0
                seg=(x,y,None,None,x+dx,y+dy); x+=dx;y+=dy
            else:
                n=b.ub(4)+2
                cdx=b.sb(n);cdy=b.sb(n);adx=b.sb(n);ady=b.sb(n)
                seg=(x,y,x+cdx,y+cdy,x+cdx+adx,y+cdy+ady); x=seg[4];y=seg[5]
            edges.append(((f0+foff-1) if f0 else None,(f1+foff-1) if f1 else None,(ln_+loff-1) if ln_ else None,seg))
    return allf,alll,edges
def segstr(s,first):
    x0,y0,cx,cy,x1,y1=s
    return ('L%d %d'%(x1,y1)) if cx is None else ('Q%d %d %d %d'%(cx,cy,x1,y1))
def rev(s):
    x0,y0,cx,cy,x1,y1=s; return (x1,y1,cx,cy,x0,y0)
def stitch(segs):
    byst={}
    for i,s in enumerate(segs): byst.setdefault((s[0],s[1]),[]).append(i)
    used=[False]*len(segs); out=[]
    for i in range(len(segs)):
        if used[i]: continue
        used[i]=True; path=[segs[i]]; end=(segs[i][4],segs[i][5]); start=(segs[i][0],segs[i][1])
        while end!=start:
            nxt=None
            for j in byst.get(end,[]):
                if not used[j]: nxt=j;break
            if nxt is None: break
            used[nxt]=True; path.append(segs[nxt]); end=(segs[nxt][4],segs[nxt][5])
        out.append(path)
    return out
def pathd(paths,close=True):
    parts=[]
    for p in paths:
        parts.append('M%d %d'%(p[0][0],p[0][1])+''.join(segstr(s,False) for s in p)+('Z' if close and (p[-1][4],p[-1][5])==(p[0][0],p[0][1]) else ''))
    return ''.join(parts)
