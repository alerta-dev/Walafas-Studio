import zlib, struct, sys, collections

TAGNAMES = {0:'End',1:'ShowFrame',2:'DefineShape',4:'PlaceObject',5:'RemoveObject',6:'DefineBits',7:'DefineButton',
8:'JPEGTables',9:'SetBackgroundColor',10:'DefineFont',11:'DefineText',12:'DoAction',13:'DefineFontInfo',14:'DefineSound',
15:'StartSound',17:'DefineButtonSound',18:'SoundStreamHead',19:'SoundStreamBlock',20:'DefineBitsLossless',21:'DefineBitsJPEG2',
22:'DefineShape2',23:'DefineButtonCxform',24:'Protect',26:'PlaceObject2',28:'RemoveObject2',32:'DefineShape3',33:'DefineText2',
34:'DefineButton2',35:'DefineBitsJPEG3',36:'DefineBitsLossless2',37:'DefineEditText',39:'DefineSprite',43:'FrameLabel',
45:'SoundStreamHead2',46:'DefineMorphShape',48:'DefineFont2',56:'ExportAssets',57:'ImportAssets',58:'EnableDebugger',
59:'DoInitAction',60:'DefineVideoStream',61:'VideoFrame',62:'DefineFontInfo2',64:'EnableDebugger2',65:'ScriptLimits',
66:'SetTabIndex',69:'FileAttributes',70:'PlaceObject3',71:'ImportAssets2',73:'DefineFontAlignZones',74:'CSMTextSettings',
75:'DefineFont3',76:'SymbolClass',77:'Metadata',78:'DefineScalingGrid',82:'DoABC',83:'DefineShape4',84:'DefineMorphShape2',
86:'DefineSceneAndFrameLabelData',87:'DefineBinaryData',88:'DefineFontName',89:'StartSound2',90:'DefineBitsJPEG4',91:'DefineFont4'}

def load(path):
    d = open(path,'rb').read()
    sig = d[:3]; ver = d[3]
    if sig == b'CWS': body = zlib.decompress(d[8:])
    elif sig == b'FWS': body = d[8:]
    else: raise Exception('unsupported '+str(sig))
    return ver, body

class Bits:
    def __init__(s, data, pos=0): s.d=data; s.p=pos; s.bit=0
    def ub(s,n):
        v=0
        for _ in range(n):
            byte=s.d[s.p]; v=(v<<1)|((byte>>(7-s.bit))&1); s.bit+=1
            if s.bit==8: s.bit=0; s.p+=1
        return v
    def sb(s,n):
        v=s.ub(n)
        if n and v&(1<<(n-1)): v-=1<<n
        return v
    def align(s):
        if s.bit: s.bit=0; s.p+=1

def rect(body,pos=0):
    b=Bits(body,pos); n=b.ub(5)
    r=[b.sb(n) for _ in range(4)]; b.align(); return r,b.p

def tags(body, pos):
    out=[]
    while pos < len(body):
        h=struct.unpack_from('<H',body,pos)[0]; pos+=2
        code=h>>6; ln=h&63
        if ln==63: ln=struct.unpack_from('<I',body,pos)[0]; pos+=4
        out.append((code,pos,ln)); pos+=ln
        if code==0: break
    return out

def header(body):
    r,p=rect(body); fr,fc=struct.unpack_from('<HH',body,p); return r,fr/256,fc,p+4

if __name__=='__main__':
    ver,body=load(sys.argv[1])
    r,fps,fc,p=header(body)
    print('version',ver,'stage(twips)',r,'size px',(r[1]-r[0])/20,(r[3]-r[2])/20,'fps',fps,'frames',fc,'bodylen',len(body))
    t=tags(body,p)
    cnt=collections.Counter(TAGNAMES.get(c,c) for c,_,_ in t)
    sz=collections.Counter()
    for c,_,l in t: sz[TAGNAMES.get(c,c)]+=l
    for k,v in cnt.most_common(): print(f'{k:28s} n={v:5d} bytes={sz[k]}')
