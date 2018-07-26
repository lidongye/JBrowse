# JBrowse镜像使用文档

## JBrowse运行方式

运行命令:  
```
docker run -p local_port:3000 -v local_path:/JBrowse/JBrowse/data jbrowse:v1.0
```

运行后访问方式:  
```
http://host:{local_port}/index.html?data=data/json/{track_name}
```

参数说明:  
```
local_port: 宿主机端口号
local_path: 宿主机数据文件目录
```

### 数据配置方式

运行命令:
```
docker run -v local_path:/JBrowse/JBrowse/data jbrowse:v1.0 bash
```
将进入JBrowse所在目录 `/JBrowse/JBrowse/`  
通过`./bin/prepare-refseqs.pl`等命令构建数据  

