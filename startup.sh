#!/bin/bash

# Author: Nati Elmaliach 

TOMCAT_URL=https://apache.mivzakim.net/tomcat/tomcat-7/v7.0.103/bin/apache-tomcat-7.0.103.tar.gz


format_output() {
    MASSAGE=$1
    echo "---------------------------------------------"
    echo $MASSAGE
    echo "---------------------------------------------"
}

# Set tomcat premmisions
configure_tomcat(){
    format_output "Setting Tomcat premmisions"
    cd .. && chmod -R 777 Tomcat
}

install_tomcat() {
    format_output "Installing Tomcat"
    cd Desktop/Tomcat
    wget -q "${TOMCAT_URL}"
    tar -zxf apache-tomcat*.tar.gz
    rm -rf apache-tomcat*.tar.gz

    configure_tomcat
}

# Validate the Tomcat folder
validate_tomcat() {
    # If the Tomcat directory does not exists
    if [ ! -d "$(pwd)/Desktop/Tomcat" ]
    then
        format_output "Creating Tomcat directory" 
        mkdir Desktop/Tomcat
        install_tomcat
    else
        format_output "Tomcat is installed"
    fi
}

install_mysql(){
    format_output "Installing MySql"
    debconf-set-selections <<< 'mysql-server mysql-server/root_password password MySuperPassword'
    debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password MySuperPassword'
    apt-get -qq update
    apt-get -qq install -y mysql-server >/dev/null 2>&1
    mysql -uroot -pMySuperPassword < create_test_table.sql
}

validate_mysql() {
    which mysql >/dev/null 2>&1

    if [ $? -eq 0 ]
    then
        format_output "Mysql is installed"
    else
        install_mysql
    fi
}

# Script entry point
main() {
    validate_mysql
    validate_tomcat 
}

main