
# SSH connect to remote device without password
This is the manual about conneting through ssh without password input

## how to set the environment
### Generate ssh key
$ ssh-keygen -t rsa

###check the generated key
$ ls -al ~/.ssh/

### Brief description 
id_rsa          | private key, Never be exposed
id_rsa.pub      | public key, Insert this to the 'authorized_keys' file of remote device
authorized_keys | Store the id_rsa.pub key (Located in ~/.ssh/)

###Change the privilege level of the file
$ chmod 700 ~/.ssh
$ chmod 600 ~/.ssh/id_rsa
$ chmod 644 ~/.ssh/id_rsa.pub
$ chmod 644 ~/.ssh/authorized_keys
$ chmod 644 ~/.ssh/known_hosts

### copy the id_rsa.pub to remote device
$ scp $HOME/.ssh/id_rsa.pub id@remote.device.ip:id_rsa.pub

### Insert the id_rsa.pub to authorized_keys at the remote device
/* This is done at the remote device, which is target*/ <br>
$ cat $HOME/id_rsa.pub >> $HOME/.ssh/authorized_keys
