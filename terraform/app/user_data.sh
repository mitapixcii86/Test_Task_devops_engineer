# #!/bin/bash

# # user_data scripts automatically execute as root user, 
# # so, no need to use sudo
sudo apt-get update -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
# until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
#   sleep 1
# done
sudo apt-get update

# # # install docker community edition
sudo apt-cache policy docker-ce
sudo apt-get install -y docker-ce

# #Build new imageterraform
sudo docker build -t app /home/ubuntu/app

# #run container with the new image
sudo docker run -d -p 80:80 --name app app

# # run container with port mapping - host:container
# docker run -d -p 80:80 --name nginx nginx

# #Static file deployment
# # cp ../app/static_website/index.html /var/www/html/
# # cp ../app/static/sample.jpeg /var/www/html/

# # setup user 'ubuntu'
# useradd -m -p "[PASSWORD_HASH]" -s /bin/bash -G sudo ubuntu
# mkdir -p /home/s/.ssh
# chown ubuntu:ubuntu /home/ubuntu/.ssh
# chmod 0700 /home/ubuntu/.ssh
# echo "[PUBLIC_KEY]" > /home/ubuntu/.ssh/authorized_keys
# chmod 0644 /home/ubuntu/.ssh/authorized_keys

# #update nginx alpine 
# sudo yum update -y
# sudo yum install docker
# sudo docker build -t app ./app
# sudo docker run -d -p 80:80 --name app app 
