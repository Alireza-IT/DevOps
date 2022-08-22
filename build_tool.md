developer write app, app needs to deployed on production server 
how to move code and dependencies : package app into one single movable file and move file into server and run it there which is called artifact
packaging the application is called building the code 
involve the compiling and compress codes into single files 

we can keep artifact inside storage for  backup & deploying multiple times and for test and production. so different use cases
storage is called artifact repository like nexus or jfron

what kind of file is the artifact : 
depend on programming language, java - java archive (jar or war file) include code and dependencies

install build tools : 
install java for example and maven and install node and npm 
install code editor 
install package manager like homebrew to install other tools 
install git by brew install git and get project from github 
open in editor and it will download the all dependencies written pom.cml
in java, we need to haveJDK to run program (file -- project structure -- project sdk -- so install java.)
homebrew install openjdk@versionofJava like 15
java --version 
then add sdk --> JDK --> choose the current JDK (please be notice of soft link for that file )
 
 just configure it and run the application 

install maven --> run/build app with maven 
brew install maven --> mvn package --> build your application 

java gradle --> open project and you can see the gradle and build it
in project structure we have set project sdk to version 15 
we do not install to install gradle if we have it in oir wrapper so ./gradlew build to do the execution of build

final project is nodeJs
we need two tools like npm and node 
brew install node --> node -v & npm -v
for running just run npm start

Build Artifact with dependencies
using build tools --> for java use maven and gradle 
they install dependencies and compile code and comprise it
Maven or gradle = maven is use XML and gradle is using groovy both have command and execute the task 
build with gradle : 
./gradlew build (w for wrapper) --> we have build folder include different file like lib which included jar file
for gradle you should use version of java less than 16 
build with maven:
we need to configure hwo to the jar file build:
in pom.xml which is configuration of maven we have to put build configuration file
then mvn install to have build --> inside th e target folder we have jar file 


run application based on artifact: 
java -jar nameofJarfile

For javaScript :
no special artifact type like jar or zip 
alternative here is npm or yarn which are package manager 
both use packages.json file for dependencies 

we can create docker instead of having different format of artifacts 
put into the docker and no need to install dependency directory on the server 
docker image is also artifact (as alternative)
no need to execute java -jar or npm start (execute them in image and pass ENV inside the image )

 no need to make jar or zip file however we need to build them.

as devOps --> developer runs their app to see and create application locally.write dependency file and configure tools but no builds
no more 
help them to build artifact because you 
build doicket iumage push to repo and run on the server as devops resposibilty 
so build & configure CI/CD pipeline in order to build app on server which iclude install dependency and running test and bundling application code and then push into repo (we do not run locally)
we need to execute tsest on build servers --> npm test and mvn test & build and package into docket image





![alt text](http://url/to/img.png)
