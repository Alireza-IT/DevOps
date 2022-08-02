
developers need database for local development 
option1 each developer install mysql db locally
each has own DB own test data
have to install Db for everyone

option2 is DB hosted remotely and access from application.test data are available and may affecting on others 

ideal one is to have both solution at same time 

how application can talk to DB ?
in the app we have configuration for DB .each has modules/library.we have to tell modules about db endpoints and give the credentials to it.

best practice is not hardcoded but use environment variable.so define variables and set endpoint and credentials from ENV.so we can pass it to application by command line or configure in code editor which is not good.because everyone needs to configure that 

we need to put them in configuration/properties file.and we can reference to this file from code.
like config.js in node and js.like endpoints and credentials

install DB for production env on same server or separate server.
data is so important and we need replicate them and create backup and perform under high load 
to manage these attribute devops handel this situation
devops = how to configure them and manage them to replicate and do backup and restore the DB and also know the connectivity of application and DB is under responsibility of developer

DATABASE TYPES

1-key-value databases like redid memcached and etcd and every key is unique and point to any value and read data by key .no joins . it is so fast because it's on memory so limited spaces .accessing data is super fast
no primary database for long term 
best for caching for real delivery or act as message queue
being as cache on top of other database

2- wide column databases : store more complex key value data, we have key but values divided in more column like cassandra and hbase
schema-less. more scalable and similar to sql.. no joins.. 
best for time-series data like IOT and no primary DB and use for history 

3- Document databases
like mongoDb dynamoDB 
documents are container for key value pairs .schema less and documents are grouped in collections and organized in relational model...no joins here....slower write and update.faster to read.
use fo mobile app and CMS & game apps & general purposes
if do not know how your data is instructed you can usr this.primary db as well 

4-relational DB 
postgres & mysql 
most used --> structured DB for structure data
schema must create at first and define attributes 
we use SQL data for reading and writing 
data are organized in table
normalizing to avoid duplicate data
ACID compliance
atomicity,consistency, isolation ,durability 
very difficult to scale (not good for containerization)

SQL vs NO-SQL

Search database 
like elastic search --> index of words

fwe can combine multiple databases
like for most data use relational 
to handle search use search Engine 
cache use key value