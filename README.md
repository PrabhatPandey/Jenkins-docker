# Jenkins-docker


#build docker container 

docker build . 


#deploy docker container with volume 

nohup docker run -p 8181:8080 -p 50000:50000 -v /home/media:/var/jenkins_home 404e2c164356 &
