
# Features
* SASS support including sourceMaps
* Minimal CSS styling of the view
* Gulp watch, build and local server tasks
* Responsive navigation
* Owl slider directive
* localStorage service for set, get, remove data
* queryService $http wrapper to handle calls
* clear folder structure
* less than 10 request in build version
* minified CSS and JS build files
* google analytics snippet

## 1. Setup
```bash
npm install
```
- install all npm and bower dependencies

**Note:** If `npm install` fails during dependency installation it will be likely caused by `gulp-imagemin`. In that case remove `gulp-imagemin` dependency from `package.json`, run `npm install` again and then install `gulp-imagemin` separately with following command: `npm install gulp-imagemin --save-dev`

## 2. Watch files
```bash
gulp
```
- all SCSS/HTML will be watched for changes and injected into browser thanks to BrowserSync

## 3. Build production version
```bash
gulp build
```
- this will process following tasks:
* clean _build folder
* compile SASS files, minify and uncss compiled css
* copy and optimize images
* minify and copy all HTML files into $templateCache
* build index.html
* minify and copy all JS files
* copy fonts
* show build folder size

## 4. Start webserver without watch task
```bash
gulp server
```

## 5. Start webserver from build folder
```bash
gulp server-build
```

## Commands Docker 

```
docker build --no-cache -t viniciuspaolozza/node-web-app:<version> .
```

```
docker run --rm -v /e/project-x:/usr/src/application/ --name nodeapp -p 8080:8080 -d viniciuspaolozza/node-web-app:<version>
```

```
docker run --name nodeapp -i -t --rm \
    -v /e/project-x:/usr/src/application \
    -p 35729:35729 \
    -p 80:80 \
    -p 8080:8080 \
    -p 3000:3000 \
    -d viniciuspaolozza/node-web-app:00.01
```

```
docker logs nodeapp
```

```
docker exec -it nodeapp /bin/bash
```

```
docker stop nodeapp
```

```
docker start -i nodeapp
```

```
docker network rm $(docker network ls | tail -n+2 | awk '{if($2 !~ /bridge|none|host/){ print $1 }}')
```

```
docker volume rm $(docker volume ls -q)
```

##Delete all containers
```
docker rm $(docker ps -a -q)
```

## Delete all images
```
docker rmi $(docker images -q)
```










docker volume create -d flocker --opt o=size=10GB webapp

docker run -d -P -v //e/project-x:/webapp --name web docker-whale //bin/bash