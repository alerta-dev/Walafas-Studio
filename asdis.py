import struct
from swfparse import *
OPS={0x04:'NextFrame',0x05:'PrevFrame',0x06:'Play',0x07:'Stop',0x08:'ToggleQuality',0x09:'StopSounds',0x0A:'Add',0x0B:'Subtract',0x0C:'Multiply',0x0D:'Divide',0x0E:'Equals',0x0F:'Less',0x10:'And',0x11:'Or',0x12:'Not',0x13:'StringEquals',0x14:'StringLength',0x15:'StringExtract',0x17:'Pop',0x18:'ToInteger',0x1C:'GetVariable',0x1D:'SetVariable',0x20:'SetTarget2',0x21:'StringAdd',0x22:'GetProperty',0x23:'SetProperty',0x24:'CloneSprite',0x25:'RemoveSprite',0x26:'Trace',0x27:'StartDrag',0x28:'EndDrag',0x29:'StringLess',0x2A:'Throw',0x2B:'CastOp',0x2C:'ImplementsOp',0x30:'RandomNumber',0x31:'MBLength',0x32:'Ord',0x33:'Chr',0x34:'GetTimer',0x35:'MBStringExtract',0x36:'MBOrd',0x37:'MBChr',0x3A:'Delete',0x3B:'Delete2',0x3C:'DefineLocal',0x3D:'CallFunction',0x3E:'Return',0x3F:'Modulo',0x40:'NewObject',0x41:'DefineLocal2',0x42:'InitArray',0x43:'InitObject',0x44:'TypeOf',0x45:'TargetPath',0x46:'Enumerate',0x47:'Add2',0x48:'Less2',0x49:'Equals2',0x4A:'ToNumber',0x4B:'ToString',0x4C:'PushDuplicate',0x4D:'StackSwap',0x4E:'GetMember',0x4F:'SetMember',0x50:'Increment',0x51:'Decrement',0x52:'CallMethod',0x53:'NewMethod',0x54:'InstanceOf',0x55:'Enumerate2',0x60:'BitAnd',0x61:'BitOr',0x62:'BitXor',0x63:'BitLShift',0x64:'BitRShift',0x65:'BitURShift',0x66:'StrictEquals',0x67:'Greater',0x68:'StringGreater',0x69:'Extends'}
def disasm(data):
    """returns list of (offset, name, args)"""
    out=[];p=0;n=len(data)
    while p<n:
        op=data[p];off=p;p+=1
        if op==0: out.append((off,'End',()));break
        if op<0x80: out.append((off,OPS.get(op,'op%02x'%op),()));continue
        ln=struct.unpack_from('<H',data,p)[0];p+=2;a=data[p:p+ln];p+=ln
        if op==0x81: args=('GotoFrame',struct.unpack('<H',a)[0]);nm='GotoFrame'; args=(args[1],)
        elif op==0x83:
            s=a.split(b'\0');nm='GetURL';args=(s[0].decode('latin1'),s[1].decode('latin1'))
        elif op==0x8A: nm='WaitForFrame';args=struct.unpack('<HB',a)
        elif op==0x8B: nm='SetTarget';args=(a[:-1].decode('latin1'),)
        elif op==0x8C: nm='GotoLabel';args=(a[:-1].decode('latin1'),)
        elif op==0x8D: nm='WaitForFrame2';args=(a[0],)
        elif op==0x88:
            cnt=struct.unpack_from('<H',a)[0];q=2;lst=[]
            for _ in range(cnt):
                e=a.index(b'\0',q);lst.append(a[q:e].decode('utf8','replace'));q=e+1
            nm='ConstantPool';args=(lst,)
        elif op==0x94:
            nm='With';args=(struct.unpack('<H',a)[0],)
        elif op==0x96:
            q=0;vals=[]
            while q<len(a):
                t=a[q];q+=1
                if t==0: e=a.index(b'\0',q);vals.append(('s',a[q:e].decode('utf8','replace')));q=e+1
                elif t==1: vals.append(('f',struct.unpack_from('<f',a,q)[0]));q+=4
                elif t==2: vals.append(('null',None))
                elif t==3: vals.append(('undef',None))
                elif t==4: vals.append(('reg',a[q]));q+=1
                elif t==5: vals.append(('b',a[q]));q+=1
                elif t==6: vals.append(('d',struct.unpack('<d',a[q+4:q+8]+a[q:q+4])[0]));q+=8
                elif t==7: vals.append(('i',struct.unpack_from('<i',a,q)[0]));q+=4
                elif t==8: vals.append(('c',a[q]));q+=1
                elif t==9: vals.append(('c',struct.unpack_from('<H',a,q)[0]));q+=2
            nm='Push';args=(vals,)
        elif op==0x99: nm='Jump';args=(struct.unpack('<h',a)[0],p+struct.unpack('<h',a)[0])
        elif op==0x9D: nm='If';args=(struct.unpack('<h',a)[0],p+struct.unpack('<h',a)[0])
        elif op==0x9A: nm='GetURL2';args=(a[0],)
        elif op==0x9E: nm='Call';args=()
        elif op==0x9F: nm='GotoFrame2';args=(a[0],)
        elif op==0x87: nm='StoreRegister';args=(a[0],)
        elif op==0x8E:
            q=0;e=a.index(b'\0',q);name=a[:e].decode();q=e+1
            na,nr=struct.unpack_from('<HB',a,q);q+=3
            fl=struct.unpack_from('<H',a,q)[0];q+=2;params=[]
            for _ in range(na):
                r=a[q];q+=1;e=a.index(b'\0',q);params.append((r,a[q:e].decode()));q=e+1
            sz=struct.unpack_from('<H',a,q)[0]
            nm='DefineFunction2';args=(name,nr,fl,params,sz,p)
            out.append((off,nm,args));continue
        elif op==0x9B:
            e=a.index(b'\0');name=a[:e].decode();q=e+1
            na=struct.unpack_from('<H',a,q)[0];q+=2;params=[]
            for _ in range(na):
                e=a.index(b'\0',q);params.append(a[q:e].decode());q=e+1
            sz=struct.unpack_from('<H',a,q)[0]
            nm='DefineFunction';args=(name,params,sz,p);out.append((off,nm,args));continue
        elif op==0x8F:
            nm='Try';args=(a.hex(),)
        else: nm='op%02x'%op;args=(a.hex(),)
        out.append((off,nm,args))
    return out
