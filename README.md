# Installing Vertica using Vagrant

The simplest single-node setup on a VirtualBox VM, **for development only**!

This setup uses Vertica 7.2.1. If you need a different version, checkout to
the other branch!

## Installation

1. Install Virtualbox and Vagrant.

2. Clone or download this repo.

3. Download `vertica_7.2.1-0_amd64.deb` (community edition) from
   http://my.vertica.com, and put the file to the repo directory.

4. (Optional) Configure VM settings such as memory capacity and IP address in
   `Vagrantfile`. Note that Vertica needs at least 2 GB of memory space.

5. `cd` to the repo directory, do `vagrant up`. Wait for it to complete.

The default connection credentials:

* Database name: localdev
* Username: dbadmin
* Password: pass

## Creating Database

Once installed, you have to create and start a database to start using Vertica.

1. In the repo directory, enter `vagrant ssh` to log in to the VM.

2. Switch to user `dbadmin`:

        sudo su - dbadmin

3. Run Vertica adminTools:

        /opt/vertica/bin/adminTools

4. If the database is not started, select Start Database.

## `vagrant up` failed on Mac OS

If you see the following error when you do `vagrant up`:

```
The guest machine entered an invalid state while waiting for it
to boot. Valid states are 'starting, running'. The machine is in the
'poweroff' state. Please verify everything is configured
properly and try again.
```

And when using VirtualBox GUI to start, you see a `VERR_SUPLIB_OWNER_NOT_ROOT`
error.

This is probably caused by the wrong permission on `/Applications` directory.
You have two solutions.

### Solution 1

Fix the permission directly:

```sh
sudo chown root /Applications
sudo chgrp wheel /Applications
```

Reference: https://forums.virtualbox.org/viewtopic.php?f=7&t=39179#p189623

### Solution 2

Go to **Disk Utility** and click **Repair Disk Permissions**.
