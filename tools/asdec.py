import re, json, sys
from asdis import *
IDENT=re.compile(r'^[A-Za-z_$][A-Za-z0-9_$]*$')
def q(s): return json.dumps(s,ensure_ascii=False)
class E:  # expression
    def __init__(s,t,lit=None,prec=99): s.t=t; s.lit=lit; s.prec=prec
    def __str__(s): return s.t
def P(e,prec):
    return '('+e.t+')' if e.prec<prec else e.t
BIN={'Add':('+',6),'Subtract':('-',6),'Multiply':('*',7),'Divide':('/',7),'Modulo':('%',7),'Add2':('+',6),'StringAdd':('add',6),
 'Less':('<',4),'Less2':('<',4),'Greater':('>',4),'Equals':('==',3),'Equals2':('==',3),'StrictEquals':('===',3),'And':('&&',2),'Or':('||',1),
 'BitAnd':('&',3),'BitOr':('|',2),'BitXor':('^',2),'BitLShift':('<<',5),'BitRShift':('>>',5),'BitURShift':('>>>',5),'StringEquals':('==',3),'InstanceOf':('instanceof',4),'StringLess':('<',4),'StringGreater':('>',4)}
def name_of(e):
    return e.lit if e.lit is not None and IDENT.match(e.lit or '') else None
def member(o,k):
    if k.lit is not None and IDENT.match(k.lit): return E(P(o,90)+'.'+k.lit,prec=99)
    return E(P(o,90)+'['+k.t+']',prec=99)
class Dec:
    def __init__(s,ops,pool,regs=None):
        s.ops=ops;s.pool=pool;s.regs=regs or {}
    def run(s):
        ops=s.ops; st=[]; out=[]  # out: list of (off,kind,data)
        def pop(): 
            return st.pop() if st else E('<?>')
        for off,nm,a in ops:
            if nm=='ConstantPool': s.pool=a[0];continue
            if nm=='Push':
                for k,v in a[0]:
                    if k=='s': st.append(E(q(v),lit=v))
                    elif k=='c': st.append(E(q(s.pool[v]) ,lit=s.pool[v]))
                    elif k=='reg': st.append(E(s.regs.get(v,'$r%d'%v)))
                    elif k=='f' or k=='d': st.append(E(repr(round(v,6)) if v!=int(v) else str(int(v)),prec=99 if v>=0 else 8))
                    elif k=='i': st.append(E(str(v),prec=99 if v>=0 else 8))
                    elif k=='b': st.append(E('true' if v else 'false'))
                    elif k=='null': st.append(E('null'))
                    else: st.append(E('undefined'))
            elif nm in BIN:
                b=pop();x=pop();op,pr=BIN[nm]
                if nm=='Greater' or True: pass
                st.append(E(P(x,pr)+' '+op+' '+P(b,pr+1),prec=pr))
            elif nm=='Not':
                x=pop(); st.append(E('!'+P(x,9),prec=9))
            elif nm=='GetVariable':
                x=pop(); n=name_of(x); st.append(E(n if n else '_var['+x.t+']'))
            elif nm=='SetVariable':
                v=pop();x=pop();n=name_of(x)
                out.append((off,'stmt',(n if n else '_var['+x.t+']')+' = '+v.t+';'))
            elif nm=='DefineLocal':
                v=pop();x=pop(); out.append((off,'stmt','var '+(name_of(x) or x.t)+' = '+v.t+';'))
            elif nm=='DefineLocal2':
                x=pop(); out.append((off,'stmt','var '+(name_of(x) or x.t)+';'))
            elif nm=='GetMember':
                k=pop();o=pop();st.append(member(o,k))
            elif nm=='SetMember':
                v=pop();k=pop();o=pop();out.append((off,'stmt',member(o,k).t+' = '+v.t+';'))
            elif nm=='StoreRegister':
                v=st[-1] if st else E('<?>'); r=a[0]
                nmr=s.regs.get(r,'$r%d'%r)
                if v.t!=nmr: st[-1]=E(nmr+' = '+v.t,prec=0) if st else None
            elif nm=='Pop':
                x=pop()
                if x.t.startswith('<?>'): continue
                out.append((off,'stmt',x.t+';'))
            elif nm=='CallFunction':
                f=pop();n=int(float(pop().t)) if True else 0
                args=[pop().t for _ in range(n)]
                st.append(E((name_of(f) or '_call['+f.t+']')+'('+', '.join(args)+')'))
            elif nm=='CallMethod':
                m=pop();o=pop();n=int(float(pop().t));args=[pop().t for _ in range(n)]
                if m.lit in (None,'') and m.t in ('undefined','""'): st.append(E(P(o,90)+'('+', '.join(args)+')'))
                else: st.append(E(member(o,m).t+'('+', '.join(args)+')'))
            elif nm=='NewObject':
                c=pop();n=int(float(pop().t));args=[pop().t for _ in range(n)]
                st.append(E('new '+(name_of(c) or c.t)+'('+', '.join(args)+')'))
            elif nm=='NewMethod':
                m=pop();o=pop();n=int(float(pop().t));args=[pop().t for _ in range(n)]
                st.append(E('new '+member(o,m).t+'('+', '.join(args)+')'))
            elif nm=='InitArray':
                n=int(float(pop().t));args=[pop().t for _ in range(n)];st.append(E('['+', '.join(args)+']'))
            elif nm=='InitObject':
                n=int(float(pop().t));items=[]
                for _ in range(n):
                    v=pop();k=pop();items.append((k.lit if k.lit else k.t)+': '+v.t)
                st.append(E('{'+', '.join(items)+'}'))
            elif nm in('Increment','Decrement'):
                x=pop();st.append(E(P(x,6)+(' + 1' if nm=='Increment' else ' - 1'),prec=6))
            elif nm=='TypeOf': x=pop();st.append(E('typeof '+P(x,9),prec=9))
            elif nm=='ToNumber': x=pop();st.append(E('Number('+x.t+')'))
            elif nm=='ToString': x=pop();st.append(E('String('+x.t+')'))
            elif nm=='ToInteger': x=pop();st.append(E('int('+x.t+')'))
            elif nm=='RandomNumber': x=pop();st.append(E('random('+x.t+')'))
            elif nm=='StringLength': x=pop();st.append(E('length('+x.t+')'))
            elif nm=='Chr': x=pop();st.append(E('chr('+x.t+')'))
            elif nm=='Ord': x=pop();st.append(E('ord('+x.t+')'))
            elif nm=='StringExtract':
                c=pop();i=pop();x=pop();st.append(E('substring('+x.t+', '+i.t+', '+c.t+')'))
            elif nm=='GetTimer': st.append(E('getTimer()'))
            elif nm=='PushDuplicate': st.append(st[-1] if st else E('<?>'))
            elif nm=='StackSwap':
                if len(st)>=2: st[-1],st[-2]=st[-2],st[-1]
            elif nm=='Delete': k=pop();o=pop();out.append((off,'stmt','delete '+member(o,k).t+';'))
            elif nm=='Delete2': x=pop();out.append((off,'stmt','delete '+x.t+';'))
            elif nm=='Return': x=pop();out.append((off,'stmt','return '+x.t+';'))
            elif nm=='Throw': x=pop();out.append((off,'stmt','throw '+x.t+';'))
            elif nm=='Enumerate' or nm=='Enumerate2':
                x=pop();out.append((off,'stmt','/*enumerate*/'));st.append(E('<?>'))
            elif nm=='TargetPath': x=pop();st.append(E('targetPath('+x.t+')'))
            elif nm=='CastOp': c=pop();o=pop();st.append(E(c.t+'('+o.t+')'))
            elif nm=='GetProperty':
                i=pop();o=pop();PR=['_x','_y','_xscale','_yscale','_currentframe','_totalframes','_alpha','_visible','_width','_height','_rotation','_target','_framesloaded','_name','_droptarget','_url','_highquality','_focusrect','_soundbuftime','_quality','_xmouse','_ymouse']
                try: pn=PR[int(float(i.t))]
                except: pn='prop'+i.t
                st.append(E((o.t.strip('"')+'.' if o.t!='""' else '')+pn))
            elif nm=='SetProperty':
                v=pop();i=pop();o=pop()
                PR=['_x','_y','_xscale','_yscale','_currentframe','_totalframes','_alpha','_visible','_width','_height','_rotation','_target','_framesloaded','_name']
                try: pn=PR[int(float(i.t))]
                except: pn='prop'+i.t
                out.append((off,'stmt',(o.t.strip('"')+'.' if o.t!='""' else '')+pn+' = '+v.t+';'))
            elif nm=='If':
                c=pop();out.append((off,'if',(c,a[1])))
            elif nm=='Jump': out.append((off,'jump',a[1]))
            elif nm=='DefineFunction2':
                name,nr,fl,params,sz,start=a
                regs={}
                r=1
                if fl&1: regs[r]='this';r+=1
                if fl&4: regs[r]='arguments';r+=1
                if fl&16: regs[r]='super';r+=1
                if fl&64: regs[r]='_root';r+=1
                if fl&128: regs[r]='_parent';r+=1
                if fl&256: regs[r]='_global';r+=1
                for rr,pn in params:
                    if rr: regs[rr]=pn
                out.append((off,'func',(name,[pn for _,pn in params],regs,start,sz)))
            elif nm=='DefineFunction':
                name,params,sz,start=a
                out.append((off,'func',(name,params,{},start,sz)))
            elif nm=='GotoFrame': out.append((off,'stmt','gotoFrame(%s);'%a[0]))
            elif nm=='GotoLabel': out.append((off,'stmt','gotoLabel(%s);'%q(a[0])))
            elif nm=='GotoFrame2': x=pop();out.append((off,'stmt','gotoAndPlay/Stop(%s);'%x.t))
            elif nm in('Play','Stop','NextFrame','PrevFrame','StopSounds'): out.append((off,'stmt',nm[0].lower()+nm[1:]+'();'))
            elif nm=='GetURL': out.append((off,'stmt','getURL(%s,%s);'%(q(a[0]),q(a[1]))))
            elif nm=='GetURL2': t=pop();u=pop();out.append((off,'stmt','getURL(%s,%s);'%(u.t,t.t)))
            elif nm=='SetTarget': out.append((off,'stmt','/*setTarget %s*/'%a[0]))
            elif nm=='SetTarget2': x=pop();out.append((off,'stmt','/*setTarget2 %s*/'%x.t))
            elif nm=='CloneSprite': d=pop();t=pop();sr=pop();out.append((off,'stmt','duplicateMovieClip(%s,%s,%s);'%(sr.t,t.t,d.t)))
            elif nm=='RemoveSprite': x=pop();out.append((off,'stmt','removeMovieClip(%s);'%x.t))
            elif nm=='Trace': x=pop();out.append((off,'stmt','trace(%s);'%x.t))
            elif nm=='StartDrag':
                pass
            elif nm=='With': out.append((off,'with',a[0]))
            elif nm=='Try': out.append((off,'stmt','/*try %s*/'%a[0]))
            elif nm=='End': pass
            else: out.append((off,'stmt','/*%s %s*/'%(nm,a)))
        return out
def structure(items, i0, i1, ind, lines, offidx, dec_func):
    i=i0
    pad='  '*ind
    while i<i1:
        off,k,d=items[i]
        if k=='stmt': lines.append(pad+d); i+=1
        elif k=='func':
            name,params,regs,start,sz=d
            lines.append(pad+'function %s(%s) {'%(name,', '.join(params)))
            dec_func(start,sz,regs,ind+1,lines)
            lines.append(pad+'}'); i+=1
        elif k=='with': lines.append(pad+'/*with %d*/'%d); i+=1
        elif k=='jump':
            lines.append(pad+'goto L%d;'%d); i+=1
        elif k=='if':
            c,tgt=d
            cond=c.t
            neg=('!'+('('+cond+')' if c.prec<9 else cond)) if not cond.startswith('!') or c.prec<9 else cond[1:]
            if cond.startswith('!') and c.prec>=9: neg=cond[1:]
            j=offidx.get(tgt)
            if j is None or j<=i:
                lines.append(pad+'if (%s) goto L%d;'%(cond,tgt)); i+=1; continue
            # do-while style handled elsewhere; check last instr before target
            last=items[j-1] if j-1>i else None
            if last and last[1]=='jump' and offidx.get(last[2],-1)>j:
                u=offidx[last[2]]
                lines.append(pad+'if (%s) {'%neg); structure(items,i+1,j-1,ind+1,lines,offidx,dec_func)
                lines.append(pad+'} else {'); structure(items,j,u,ind+1,lines,offidx,dec_func)
                lines.append(pad+'}'); i=u
            elif last and last[1]=='jump' and offidx.get(last[2],10**9)<=i:
                lines.append(pad+'while (%s) {'%neg); structure(items,i+1,j-1,ind+1,lines,offidx,dec_func)
                lines.append(pad+'}'); i=j
            else:
                lines.append(pad+'if (%s) {'%neg); structure(items,i+1,j,ind+1,lines,offidx,dec_func)
                lines.append(pad+'}'); i=j
        else: i+=1
def decompile(data, base_off=0, pool=None):
    lines=[]
    state={'pool':pool or []}
    def run_range(start,size,regs,ind,lines):
        sub=data[start:start+size]
        ops=disasm(sub)
        # fix offsets to absolute
        ops=[(o+start,n,a) for o,n,a in ops]
        # adjust jump targets / func starts: jump targets are absolute within the data already (p computed relative to sub) -> shift
        fixed=[]
        for o,n,a in ops:
            if n in('Jump','If'): a=(a[0],a[1]+start)
            if n=='DefineFunction2': a=a[:5]+(a[5]+start,)
            if n=='DefineFunction': a=a[:3]+(a[3]+start,)
            fixed.append((o,n,a))
        dec=Dec(fixed,state['pool'],regs)
        items=dec.run()
        state['pool']=dec.pool
        # functions: skip over ops inside function bodies -> they are separate; disasm of parent continues linearly through body! need skipping
        return items
    # Need proper skipping of function bodies: do own loop
    def decomp_range(start,size,regs,ind,lines):
        sub=data[start:start+size]
        ops=disasm(sub); fixed=[]
        skip_until=-1
        for o,n,a in ops:
            o+=start
            if o<skip_until: continue
            if n in('Jump','If'): a=(a[0],a[1]+start)
            if n=='DefineFunction2':
                a=a[:5]+(a[5]+start,); skip_until=a[5]+a[4]
            if n=='DefineFunction':
                a=a[:3]+(a[3]+start,); skip_until=a[3]+a[2]
            fixed.append((o,n,a))
        dec=Dec(fixed,state['pool'],regs); items=dec.run(); state['pool']=dec.pool
        offidx={}
        for idx,(o,k,d) in enumerate(items): offidx.setdefault(o,idx)
        # map targets that fall on removed offsets to next item
        offs=sorted(offidx)
        import bisect
        full={}
        def resolve(t):
            if t in offidx: return offidx[t]
            k=bisect.bisect_left(offs,t)
            return offidx[offs[k]] if k<len(offs) else len(items)
        class OI(dict):
            def get(self,t,default=None): return resolve(t)
            def __getitem__(self,t): return resolve(t)
        structure(items,0,len(items),ind,lines,OI(),decomp_range)
    decomp_range(0,len(data),{},0,lines)
    return '\n'.join(lines)
if __name__=='__main__':
    d=open(sys.argv[1],'rb').read()
    open(sys.argv[2],'w').write(decompile(d))
