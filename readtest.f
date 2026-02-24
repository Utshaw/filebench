set $dir=/tmp/filebenchtest
set $nfiles=750
set $filesize=64m
set $iosize=256k

define fileset name=data, path=$dir, entries=$nfiles, dirwidth=100, size=$filesize, prealloc=100

define process name=reader {
  thread name=t1 {
    flowop openfile name=open, filesetname=data
    flowop read name=rd, iosize=$iosize
    flowop closefile name=cl
  }
}

run 60

