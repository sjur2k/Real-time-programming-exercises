package main

import (
	"encoding/hex"
	. "fmt"
	"net"
	"time"
)

var t_sleep time.Duration = time.Millisecond*20

func send_msg(ch chan []byte, message []byte){
	ch<-message
	time.Sleep(t_sleep)
}

func main(){
	addr,_:=net.ResolveTCPAddr("tcp4","192.168.0.118:30000")
	conn,_:=net.ListenTCP("tcp4",addr)
	defer conn.Close()
}