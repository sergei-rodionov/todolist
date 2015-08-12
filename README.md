
Demo application
TODO Application

------------------------------------------------
For MYSQL server config (my.ini) add/edit:
[mysql]
default-character-set=utf8
[mysqld]
character-set-server=utf8
collation-server=utf8_general_ci
------------------------------------------------
For web-server Tomcat:
JAVA_OPTS -Dfile.encoding=UTF-8


 Config WEB/Spring/Hibernate not use *.xml file.

 Auto fill demo data in run app. (create-drop table)


(c) Sergei Rodionov, 2015
mailto:mail@sergeirodionov.ru