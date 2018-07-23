## (very) simple port forwarding

A convenience script for forwarding a set of ports over ssh.

## Usage

### A list of ports/hosts

Put a list of ports and hosts to forward in a text file (`ports_to_forward.txt`):

```
8888 hostname
8887 hostname2
```

where `hostname`(s) must be understandable by `ssh`.


Then forward all of these to `localhost` 

```bash
bash ports.sh --list ports_to_forward.txt
```

or reconnect them:


```bash
bash ports.sh --list ports_to_forward.txt --reconnect
```

or disconnect them:

```bash
bash ports.sh --list ports_to_forward.txt --disconnect
```

### Single port usage

You can also pass a single port/host to connect/disconnect/reconnect

```bash
bash ports.sh --port 8888 --host hostname
```


