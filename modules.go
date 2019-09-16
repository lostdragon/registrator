package main

import (
	_ "registrator/consul"
	_ "registrator/consulkv"
	_ "registrator/etcd"
	_ "registrator/skydns2"
	_ "registrator/zookeeper"
)
