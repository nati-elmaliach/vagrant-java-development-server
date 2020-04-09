# How to start the developmnet server
This box is build on an exsisting java development-box: https://app.vagrantup.com/danielgazineu/boxes/trusty64-eclipse

This development server includes:
- Eclipse
- java
- Tomcat v7.0.103
- Mysql(you can overwrite the `create_test_table.sql`)
- The Communication repo


# Steps: 
 - install vagrant https://www.vagrantup.com/downloads.html
 - install VirtualBox https://www.virtualbox.org/wiki/Downloads
 - git clone <this repo url>
 - cd to the cloned directory and run `vagrant up`
 - wait for the machine to boot up , it may take a couple of minutes the first time.


# Configurations:
- To access the database run `mysql -uroot -pMySuperPassword`
- The communication database is for testing only

