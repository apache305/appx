# appx


流程大概是这样

1. 首次使用时将所有的代码会同步到本地，git clone https://github.com/apache305/appx.git 
2. 编辑文件a并保存
3. 将文件a标记出来，需要提交 git add a
4. 然后提交所有标记过的文件 git commit -m "更新的内容简介"
5. git push 把本地代码推送到服务器上更新
6. 每次更改之前记得先git pull 一下 保证跟服务器的同步上。
