# 简介
一个远程的课题，由php+vue的小型的教务管理系统
# 课题要求
基于Laravel 5.5 LTS和 Laravel Passport 以及第三方扩展包。设计一套小型的教务管理系统
用户：
系统管理员
教师：角色为 学校管理员、普通教师

学生
Api：教师和学生可以通过接口实现多表认证(同一个接口登录系统)以及操作，并且提供API文档。
Web需求(用户端网站，前后端分离，所有的请求使用上面的Api和后端交互)：

老师部分：
1、教师可以通过邮箱注册网站，填写表单，申请开通学校。一个教师可以申请多个学校。系统管理员在后台审批。申请者自动角色为 学校管理员
2、学校管理员可以通过邮箱邀请别的人成为学校的教师，角色为普通。
3、学校管理员可以在后台创建学生以及给学生发消息（websocket）
4、普通教师只能查看学生。
5、老师可以查看关注自己的学生列表

学生部分：
1、学生可以用提供的帐号密码进行网站登录。学生只能属于一个学校。
2、学生可以在网站和老师即时聊天（websocket）
3、学生可以在网站收到老师发来的消息通知（websocket）
4、学生可以关注、取消关注喜欢的老师

Line：
Line用户可以第三方登录系统，并且通过Api绑定已有的用户。一个Line用户可以同时绑定一个教师和多个学生。


后台Admin(使用Laravel Admin)
系统管理员能登录, 并且进行系统级的管理操作。
系统管理员可以推送消息给网站用户，也可以推送消息给Line的用户。

部署：项目部署到Heroku，可以正常线上完整使用。
websocket如果自搭服务器过于困难可以考虑使用Heroku Addon的Pusher

# 完成状态
前端仓库: https://github.com/xiang23808/class_web.git
后端仓库:https://github.com/xiang23808/class.git

前端网址:http://class_web.mjsdfgg.cn/
教师管理员账号:
teacher1@gmail.com    teacher1
教师账号:
teacher2@gmail.com    teacher2
teacher3@gmail.com    teacher3

后端网址:http://class.mjsdfgg.cn/admin
管理员账号:
admin    admin

接口地址:
http://class.mjsdfgg.cn
接口文档:
根目录/class.openapi.json

未实现功能：Line登录调试

### 后台推送服务启动和停止
php artisan wk start --d
php artisan wk stop