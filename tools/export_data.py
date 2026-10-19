import re, json
from swfmodel import *
src=open('act1.as').read()
def tbl(prefix):
    out=[]
    for m in re.finditer(r'^'+re.escape(prefix)+r'\.push\((.*)\);$',src,re.M):
        out.append(json.loads(m.group(1)))
    return out
parts={k:tbl('GameData.Parts.'+k) for k in ['Hats','Items','Back','Acc','Body','Shoes','Arms','Hair','Eyes','Mouth']}
presets={}
for m in re.finditer(r'^newPreset\((.*)\);$',src,re.M):
    a=json.loads('['+m.group(1)+']'); presets[a[0]]=dict(zip(['body','eye','mouth','head','hat','arm','shoe','item','wing','acc'],a[1:]))
ver=re.search(r'^GameData.Version = (.*);',src,re.M).group(1)
fr,_=sprite_tl(exports['Char']); layers=[]
names={'wings':'Back','head':'Hair','legs':'Shoes','arms':'Arms','item':'Items','body':'Body','head2':'Hair2','eyes':'Eyes','mouth':'Mouth','hat':'Hats','accessory':'Acc'}
for dp,o in sorted(fr[0].items()):
    m=o['m']; layers.append({'name':o['name'],'lib':names[o['name']],'m':[m[0],m[1],m[2],m[3],m[4],m[5]]})
hf,_=sprite_tl(exports['Hair'])
e2=[o for dp,o in hf[0].items() if o.get('name')=='eye2'][0]['m']
data={'version':ver,'parts':parts,'presets':presets,'layers':layers,'eye2m':list(e2),
 'skin':[x for x in re.findall(r'^GameData.Palette.Skin.push\("(0x\w+)"\)',src,re.M)]}
json.dump(data,open('out/data.json','w'),separators=(',',':'),ensure_ascii=False)
print({k:len(v) for k,v in parts.items()},len(presets),ver)
print(parts['Hats'][:3],parts['Hair'][:2],parts['Eyes'][:2])
print(list(presets.items())[:2]); print(layers[1],e2)
