MySQL database single DB migrate
=========
两种数据迁移方式:
 - 导出导入
 - 传输表空间
  
  
mysql database 迁移工具  
使用mydumper 导出数据，然后导入到目标数据库

Requirements
------------
install mydumper:   
<font color='red'>  https://github.com/maxbube/mydumper </font>

Role Variables
--------------
 - bk_type              --->   DB migrate type,0 is mydumper 1 is Copying Tablespaces
 - srcdbhost            --->   source database host ip address
 - srcdbport            --->   source database port
 - backupdbname         --->   backup database name
 - srcdbmylogin         --->   source database mysql account
 - srcdbmypasswd        --->   source database mysql account password
 - backupdir            --->   directory for backup files
 - destdbhost           --->   restore database host ip
 - destdbport           --->   restore database port
 - destdbmylogin        --->   restore database mysql account
 - destdbmypaasswd      --->   restore database mysql account password


Dependencies
------------


Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------

BSD

Author Information
------------------
LG  
