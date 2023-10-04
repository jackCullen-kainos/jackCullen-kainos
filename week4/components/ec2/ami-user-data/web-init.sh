#!/bin/bash
echo "*** Installing apache2"
sudo apt update -y
sudo apt install apache2 -y
echo "*** Completed Installing apache2"
echo "<h1>loading from $(hostname -f)..</h1>" > /var/www/html/index.html