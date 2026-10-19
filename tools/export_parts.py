import json, os, time
from svgout import *
CATS={'Hats':'Hats','Hair':'Hair','Eyes':'Eyes','Mouth':'Mouth','Body':'Body','Arms':'Arms','Shoes':'Shoes','Items':'Items','Back':'Wings','Acc':'Acc'}
# sprite ids from exports: Hats=2498 Hair=771 ...
def lib(name,cid,nframes,hairov=False,hn=('HairColor',),skip=()):
    GID[0]=0
    defs=[];gs=[]
    for f in range(1,nframes+1):
        s=render(cid,f,defs,None,False,skip,{'HairColor':f} if hairov else None,0,hn)
        gs.append('<g id="f%d">%s</g>'%(f,s))
    svg='<svg xmlns="http://www.w3.org/2000/svg"><defs>%s</defs>%s</svg>'%(''.join(defs),''.join(gs))
    # gradient ids must be unique across libs: prefix
    svg=svg.replace('id="g','id="%s_g'%name).replace('url(#g','url(#%s_g'%name)
    open('out/parts/%s.svg'%name,'w').write(svg); return len(svg)
t=time.time()
spec=[('Hats',exports['Hats']),('Hair',exports['Hair']),('Hair2',exports['Hair2']),('Eyes',exports['Eyes']),('Mouth',exports['Mouth']),('Body',exports['Body']),('Arms',exports['Arms']),('Shoes',exports['Shoes']),('Items',exports['Items']),('Back',exports['Wings']),('Acc',exports['Acc'])]
tot=0
for n,cid in spec:
    nf=len(sprite_tl(cid)[0])
    hair=n in('Hair','Hair2')
    sz=lib(n,cid,nf,hairov=hair,hn=('HairColor',) if hair else (),skip=('eye2',) if n=='Hair' else ())
    tot+=sz; print(n,cid,nf,sz//1024,'KB')
# Eye2 (child of head): frames 7
cid=exports['Eye2']; nf=len(sprite_tl(cid)[0]); print('Eye2',nf,lib('Eye2',cid,nf,hairov=True,hn=()) //1024,'KB')
for n,k in (('BGs','Background'),('Objects','Objects')):
    cid=exports[k]; nf=len(sprite_tl(cid)[0]); print(n,nf,lib(n,cid,nf,hn=())//1024,'KB')
print('total',tot//1024,'KB',time.time()-t,'s',STAT)
