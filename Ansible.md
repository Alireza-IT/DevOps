tool to automate 
execute tasks from your machine
we can do from operating system to cloud providers
ansible is agent less to we need to do the ssh to the servers 
no deployment effort in beginning 

how does it work?
it works with modules and it is basic small program that do actual work and get pushed to the target server and do job and remove at the end 
module is one small specific task like start server or create directory (check the documentation)

ansible uses YAML....no need to learn programming language.

so for complex project we need to create different modules in certain sequence then group together 
that why ansible playbook come in
so sequential modules grouped in tasks (tasks is action to be performed)
each module get name and arguments and describe task using name 

to define the target servers, we define HOSTS and how can
execute tasks by REMOTE_USER...
hosts: databases
remote_user: root

which tasks 
which hosts 
which user

ansible reproduce app acroos many environemtn and it controls hosts and docker container

we can use vars for creating variables for repeating values.

SO which task should be execute on which hosts by which user per each play

playbook describe how and which order and where and what modules should be executes

reference for hosts comes from hosts files which is acting as inventory we can define ip address and hostname together with name 

playbook is like the dockerfile and allows me reproduce app on many platform
also we can config hosts as well as docker containers 

ansible tower which is ui dashboard

install ansible : on local machine and then connect to target and deploy our playbook
or have separate server with ansible and it is going to connect to the hosts
brew install ansible or pip install ansible 
ansible --version 


create some server to work on them and just connect them via ssh 
but make sure python is installed on them 

this is sample = 134.209.255.142 ansible_ssh_private_key_file=~/.ssh/id_rsa ansible_user = "xxx"

tell ansible what are the hosts so we need to create file named hosts

ansible_ssh_private_key_file=~/.ssh/MainKey.pem ansible_user="XXX"

to interact with servers we can do
ansible all -i hosts -m ping --> run this command for all hosts in hosts file 
-m --> modules ping 

all--> refer to all target hosts in hosts file 
we need to group servers in ansible so by ansible syntax [droplet]
we can group the mbasedd on where and what and when they are 
what like databsae server s or web server s where like datacenter or east or west 
when like stage or dev or test
  
ansible groupname -i hosts -m ping

specify one server by doing this :
ansible hostname or ip -i hosts -m ping 


if you have lots of servers with same attributes like key and username 
we can create 
[groupname:vars]
put attribute and values here under list of servers and groups



automate configuration of host key checking to run ansible without interuption ...how to do that? instead of answering yes 
two way : 
long lived servers and do not have ephemeral server 
do this ssh key from the machine once where ansible is running 
check is done once and remains for ever 
step 1 = so create one server and added to known_hosts 
ssh-keyscan -h ipaddress >> ~/.ssh/known_hosts = to save and add remote server to know hosts file.
on that remote server has to have public ssh key and we have to store my public step 2 = ssh key on the remote server 
ls .ssh/authorized_keys on remote user
ssh-copy-id root@188... --> take public key from default location to the this server 188... and add key to home of default user
then add remote host to hosts



second way:
disable key check and less secure 
servers are dynamically created and destroyed (like server for test) so do not use in productions
do this in ansible configuration files
ls /etc/ansible --> if not exist create one for yourself 
/etc/ansible/ansible.cfg 
or in user home directory --> ~/.ansible.cfg to disable key check (name must be .ansible.cfg)
[default]
host_key_checking = False

Ansible playbooks
create ansible project folder and open editor and create configuration 
one hosts file and config files (playbook) at least 
ordered list of task and plays and tasks rrun in order from top to bottom 
start with --- to start block 
playbook has multiple plays and play is a group of tasks 
like play for all database servers and another play for nginx server and can have both of them in one playbook 
every play has name and it's optional 
and every play should have hosts (define by hosts:) can define individual servers or group od servers
then define task which is list of command which can execute on servers which and every task has it's own name and now we have define module (module is a specific command that we are executing ) so put name of module like apt and we have put name of package and state to define the version
or use module service which we want to start the nginx service and we want it to be started

we can copy or create config file for ansible.cfg

to run playbook is (ansible-playbook -i hostsfile nameOfplaybook)

where is module name and attribures related to modules ones: use ansible documentation --> search and module index 

collection index --> ansible version 2.9 and earlier all modules were included
single repo ansible/ansible contains all ansible code and ansible module & plugins
in 2.10 we have ansible repo contains and core ansible (base packages)
modles moved into various collections

collection: packaging and distribution format for all ansible content
package them together as bundle meaning playbook plugings and modules all together 
like ansible built-in 
plugin is also piece ansible funstionality to modules to enhance module functionality like add feature to terminate instances
apt --> ansible.builtin.apt
some start with community which is maintenaed by community

ansible-galaxy collection list
 so the collection is bundle of ansible content(modules and plugins)and these are piece of codes but where is this content hosted and shared? they have to be listed somewhere --> on of the main hub for collection is galaxy.
just to fetch the collection from the hub 
COMMAND : ansible-galaxy collection install amazon.aws --> to install some of them
for bigger ansible collection we can create own collections
and have predefine structure and need galaxy.yaml file which is metadata file 
you can update each collection individually by same command on installation 


return values of modules which return data normally
this data can be registered into a variable

command and shell modules are stateless. so they need conditions 
 
Ansible and terraform have state management but python does not have and they can cehck if something need to be done or not

run with different user .create usr and do some task with some privileges by using this attribute --> 'become_user' = set to user with desired privileges


set value for variable in ansible :
1 way is to set on play itself by attributes vars:
                                                - 
  vars:
    - location: /Users/alireza/w/DevOps/bootcamp-project/simple-nodejs
    - version: 1.0.0
    - destination: /home/ubuntu/

2 way is from outside od playbook and pass them when we are executing playbook
ansible-playbook -i hosts name.yaml -e "version=1.0.0 location=sfsdfsdf"
much more better you can parameterize them better.

3 way is use variable external file
so use variable file we can use and tell ansible to use that file for variables 
for renaming file we can use find which return a list of files based on speciific criteria 

conditioning with attribute called when : 



wait for and pause modules are for waiting for sometimes for somethings
