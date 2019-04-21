<!-- Heading -->
# Flask app on docker - mysql on local

```app.py
  app.config['MYSQL_HOST'] = 'docker.for.mac.localhost'
  app.run(debug=True, host='0.0.0.0', port=5000)
```

```docker
docker run --name myflaskapp -d -e PMA_HOST=docker.for.mac.localhost -e PMA_PORT=3306 -p 5001:5000 hungfhq/myflaskapp
```

# Flask app on docker - mysql on docker

```app.py
app.config['MYSQL_HOST'] = 'mysql'
```

```docker network create mysql-network
docker run --name mysql \
           --net=mysql-network \
           -p 8001:3306 \
           -e MYSQL_ROOT_PASSWORD=root \
           -v $(pwd)/database:/var/lib/mysql \
           -d mysql:5.7  > /dev/null

docker run --name myflaskapp \
           --net=mysql-network \
           -e MYSQL_ROOT_PASSWORD=root \
           -e PMA_HOST="mysql" \
           -e PMA_PORT=3306 \
           -p 5001:5000 \
           -d hungfhq/myflaskapp
```