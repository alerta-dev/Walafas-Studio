from asdis import *
import struct
ver,body=load(__import__('os').environ.get('SWF','Creador_De_Walfas_Walfas_Creator.swf'))
r,fps,fc,p=header(body);T=tags(body,p)
acts=[(pos,ln) for c,pos,ln in T if c==12]
for i,(pos,ln) in enumerate(acts):
    open(f'act{i}.bin','wb').write(body[pos:pos+ln])
    print(i,ln)
