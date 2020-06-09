# Getting started with containerd sample

https://containerd.io/docs/getting-started/

## Requirements

* Vagrant
* VirtualBox

## Usage

### Boot the VM using Vagrant

```sh
$ vagrant up

$ vagrant ssh

vagrant@contrib-buster:~$ cd /vagrant
vagrant@contrib-buster:~$ make
go build main.go
go: downloading github.com/containerd/containerd v1.3.4
go: downloading github.com/containerd/ttrpc v1.0.1
go: downloading github.com/pkg/errors v0.9.1
go: downloading google.golang.org/grpc v1.29.1
go: downloading github.com/opencontainers/runc v0.1.1
go: downloading github.com/containerd/typeurl v1.0.1
go: downloading github.com/docker/distribution v2.7.1-0.20190205005809-0d3efadf0154+incompatible
go: downloading golang.org/x/sync v0.0.0-20200317015054-43a5402ce75a
go: downloading github.com/gogo/protobuf v1.3.1
go: downloading github.com/sirupsen/logrus v1.6.0
go: downloading github.com/opencontainers/image-spec v1.0.1
go: downloading github.com/golang/protobuf v1.3.3
go: downloading github.com/containerd/continuity v0.0.0-20200413184840-d3ef23f19fbb
go: downloading github.com/opencontainers/runtime-spec v1.0.2
go: downloading github.com/syndtr/gocapability v0.0.0-20180916011248-d98352740cb2
go: downloading golang.org/x/net v0.0.0-20200602114024-627f9648deb9
go: downloading google.golang.org/genproto v0.0.0-20200117163144-32f20d992d24
go: downloading github.com/docker/go-events v0.0.0-20190806004212-e31b211e4f1c
go: downloading github.com/gogo/googleapis v1.4.0
go: downloading github.com/containerd/fifo v0.0.0-20200410184934-f15a3290365b
go: downloading github.com/opencontainers/go-digest v1.0.0
go: downloading golang.org/x/sys v0.0.0-20200602225109-6fdc65e7d980
go: downloading golang.org/x/text v0.3.2
sudo ./main
2020/06/09 10:34:23 Successfully pulled docker.io/library/redis:alpine image
2020/06/09 10:34:23 Successfully created container with ID redis-server and snapshot with ID redis-server-snapshot
1:C 09 Jun 2020 10:34:23.643 # oO0OoO0OoO0Oo Redis is starting oO0OoO0OoO0Oo
1:C 09 Jun 2020 10:34:23.647 # Redis version=6.0.4, bits=64, commit=00000000, modified=0, pid=1, just started
1:C 09 Jun 2020 10:34:23.648 # Warning: no config file specified, using the default config. In order to specify a config file use redis-server /path/to/redis.conf
1:M 09 Jun 2020 10:34:23.671 # You requested maxclients of 10000 requiring at least 10032 max file descriptors.
1:M 09 Jun 2020 10:34:23.671 # Server can't set maximum open files to 10032 because of OS error: Operation not permitted.
1:M 09 Jun 2020 10:34:23.671 # Current maximum open files is 1024. maxclients has been reduced to 992 to compensate for low ulimit. If you need higher maxclients increase 'ulimit -n'.
1:M 09 Jun 2020 10:34:23.672 * Running mode=standalone, port=6379.
1:M 09 Jun 2020 10:34:23.673 # WARNING: The TCP backlog setting of 511 cannot be enforced because /proc/sys/net/core/somaxconn is set to the lower value of 128.
1:M 09 Jun 2020 10:34:23.673 # Server initialized
1:M 09 Jun 2020 10:34:23.673 # WARNING overcommit_memory is set to 0! Background save may fail under low memory condition. To fix this issue add 'vm.overcommit_memory = 1' to /etc/sysctl.conf and then reboot or run the command 'sysctl vm.overcommit_memory=1' for this to take effect.
1:M 09 Jun 2020 10:34:23.674 * Ready to accept connections
1:signal-handler (1591698866) Received SIGTERM scheduling shutdown...
1:M 09 Jun 2020 10:34:26.688 # User requested shutdown...
1:M 09 Jun 2020 10:34:26.688 * Saving the final RDB snapshot before exiting.
1:M 09 Jun 2020 10:34:26.689 * DB saved on disk
1:M 09 Jun 2020 10:34:26.689 # Redis is now ready to exit, bye bye...
redis-server exited with status: 0
```

The generated vm has the below components.

* go 1.14
* containerd 1.3.4
* runc 1.0.0-rc6

## crt

If you want to communicate the containerd without go codes, you can use `crt` command. Here is sample executions.

```sh
# show containers in namespace example
vagrant@contrib-buster:~$ sudo /opt/containerd/bin/ctr -n example c ls
CONTAINER    IMAGE    RUNTIME

# remove containers in namespace example
vagrant@contrib-buster:~$ sudo /opt/containerd/bin/ctr -n example c rm CONTAINER_NAME

# show tasks in namespace example
vagrant@contrib-buster:~$ sudo /opt/containerd/bin/ctr -n example t ls
CONTAINER    IMAGE    RUNTIME

# kill a container
vagrant@contrib-buster:~$ sudo /opt/containerd/bin/ctr -n example t kill TASK_ID
```
