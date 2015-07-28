# Rails & Mysql Docker Containers


This is a simple tutorial to connect rails app with mysql. Include Dockerfile's file to install rails enviroments and blog's app to test


## How to use:

Build images from Dockerfile

<code>docker build -t="kalelc/rails" .</code>

Get official images mysql from dockerhub

<code>docker pull mysql</code>

Run Mysql container

<code>docker run -p 3306:3306 -d --name database -e MYSQL_ROOT_PASSWORD=unodostres mysql</code>

Run Rails container

<code>docker run -d -p 3000:3000 --name webapp kalelc/rails</code>

Show list of containers for get the CONTAINER ID to execute migrations; by example c3b1d35758da is my CONTAINER ID

<code>docker ps -l </code>

Execute migrations in container

<code>docker exec -it c3b1d35758da bundle exec rake db:create </code>

<code>docker exec -it c3b1d35758da bundle exec rake db:migrate </code>

<code>docker exec -it c3b1d35758da bundle exec rake db:seed </code>

Finally you can see app in the browser. If you use mac remember replace your ip by boot2docker ip.

<code>boot2docker ip</code>


