we can do run test build artifacts publish artifacts dpeloy artofcats send notification

integrated with others technological like docker build tools repositories deployment servers

jenkins has different plugins

run test --> with build tools you execute the tst command like npn test and mvn teest so we need to configure test environment
build application --> build tools or docker 
publish docker images -->store credential in jenkins


for installation we need to have open twp port 8080 for accessing ui and 50000 for lustering jenkings worker and master

we have jenkings administrator to handle  jenkins itself (devopus)
jenkins user who are creating jobs inorder to run workflow (devops & developer)

install build tool on jenkins:
base on language we need for exapme maven command when we want to create job 
or for javascript we need npm.

we can do that with jenkins plugins or install those tools directly on servers or have them as docker beside of jenkins

for plugins --> manage jekins --< global tool configuration -> maven --> add maven and give name and save 

second solution: install tool on server where jenkins running --> manage --> plugins --> search for node for example
and we need them in beside of jenkins--> login with root user docker exec -u 0 .....


apt isntall curl
curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh
./nodesource_setup.sh
apt update 
apt install node