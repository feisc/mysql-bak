### 
本机上已经部署了mysql的服务（包括configMap,deployment,service等等）。cronjob中的mysql 只是作为客户端，通过脚本向服务端，发送备份的命令。