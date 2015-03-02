# Installing Vertica using Vagrant

The simplest single-node setup on a VirtualBox VM, **for development only**!

## Installation

1. Install Virtualbox and Vagrant.

2. Clone or download this repo.

3. Download `vertica_7.1.1-0_amd64.deb` (community edition) from
   http://my.vertica.com, and put the file to the repo directory.

4. (Optional) Configure VM settings such as memory capacity and IP address in
   `Vagrantfile`. Note that Vertica needs at least 2 GB of memory space.

5. `cd` to the repo directory, do `vagrant up`. Wait for it to complete.

The default connection credentials:

* Username: dbadmin
* Password: pass

## Creating Database

Once installed, you have to create and start a database to start using Vertica.

1. In the repo directory, enter `vagrant ssh` to log in to the VM.

2. Switch to user `dbadmin`:

        sudo su - dbadmin

3. Run Vertica adminTools:

        /opt/vertica/bin/adminTools

4. Select Configuration Menu > Create Database. Then follow the instruction.

5. If the database is not started, select Start Database.
