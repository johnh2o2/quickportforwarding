## (very) simple port forwarding

A convenience script for forwarding a set of ports over ssh.

## Install

To install the script, run 

```bash
sudo bash install.sh
```

from the parent directory. This will copy the `portconn` script
to `/usr/local/bin`. The installation location can be changed by
editing the `$PREFIX` variable in the `install.sh` file.

The `DEFAULT_PORT_LIST` can also be changed in the `install.sh` script.

## Usage

This script basically wraps around the following `ssh` command:

```bash
ssh -fNT -L <port>:localhost:<port> <host>
```

### Single port usage

For a single port/host, just run

```bash
$ bash portconn --port 7777 --host crouton
== forwarding 7777@crouton -> localhost:7777  ==
```
to connect port 7777 on the host "crouton" (can be any host understood by `ssh`).

Otherwise, to disconnect port 7777:
```bash
$ bash portconn --port 7777 --host crouton --disconnect
[port 7777] killing pid 10616
```
Or to reset the connection (basically disconnect followed by connect)

```bash
$ bash portconn --port 7777 --host crouton --reset
[port 7777] killing pid 10667
== forwarding 7777@crouton -> localhost:7777  ==
```


### A list of ports/hosts

Put a list of ports and hosts to forward in a text file (`ports.txt`):

```
8888 hostname
8887 hostname2
```

where `hostname`(s) must be understandable by `ssh`.


Then forward all of these to `localhost` 

```bash
bash portconn --list ports.txt
```

or reset the connections:


```bash
bash portconn --list ports.txt --reset
```

or disconnect them:

```bash
bash portconn --list ports.txt --disconnect
```



