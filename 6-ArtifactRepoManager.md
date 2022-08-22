
Artifact = apps built into a single file which can be shared and movable with different format like tar or zip
we have repository for different format so different repositories for different format.

so we need to manage all these repositories which is called artifact repo manager like nexus
help us to upload and store different built artifacts and download them later and it's central storage 
also we have public repo manger like libraries and frameworks which we use as dependencies like maven repositories 

with nexus is host own repo and setup proxy repo for public one to kind of consolidate all arti manager with central management control
nexus is open source.
Features :
integrate with LDAP
flexible and powerful rest api for integration with other tools because mainly it is not controlled manually 
it is part of automation and CI/CD tools like jenkins...whn jenkins buuild the artifact, can push the artifact to the nexus or need to build just retrieve it from the nexus 
we have backup and restore because of its' storage mechanism.
multi format support and metadata tagging like labelling and tagging artifacts 
also it has cleanup policies . in CI/CD every commit will generate new artifact so we need handful of latest one so clean artifacts 
also it has search functionality to across projects.
also we have token support for system user authentication 


install java 
cd opt 
wget url of nexus 
we will have two folders 
    nexus : contains runtime of application od nexus 
    Sonatype: own nexus configuration and data and contain directories based on configuration and also contain file that log of ip address that accessed nexus and also logs of nexus app and upload files and metadata also we can use this folder for backup

!!!!so if you update the nexus the nexus folder is going to changes and configuration remains untouched

start service :
    create own user and start service with that user which has permission 
    adduser nexus and user must be able to access to the these folders 
    chown -R nexus:nexus directoryname 
    set nexus config to run based on nexus user --> vim nexusfolder/bin /nexus.rc --> run_as_user=""nexus
    switch to nexus user with su - nexus 
    /opt/nexus..../bin/nexus start --> to start the nexus 
    ps aux 
    open port 8081 in firewall inbound 

we have default user admin with password in cat opt/sonatype/nexus3/admin.password

on setting

Repository Type:
some repo are created already and each one has type 
Type : proxy : linked to remote repo like maven developer can download jar file for their application 
                check the component locally if not it will contact remote repo via proxy and get it and store into nexus (cache it) & give the developer single endpoints specially in build tools
     we can create own repo with different format and types 
     hosted repo : primary storage for artifact and component (company artifact).acting as central storage 
     group repo : have multiple repos and each one has its own purpose and need to have single endpoints for all of them so combine some repo with single address 
     
