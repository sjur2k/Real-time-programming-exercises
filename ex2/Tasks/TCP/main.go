package main

import (
	. "fmt"
	"net"
	"time"
)

const (
	T_SLEEP time.Duration = time.Second
	BUF_SIZE = 1024
	LOCAL_IP="192.168.0.118"
	REMOTE_IP="192.168.0.118" //Change this if running at RT-lab
	PORT_DELIM = 33546 //Reads delimited messages that use \0 as marker
	PORT_FIXED = 34933 //Reads messages of length 1024
	FIXED_MESSAGE_LENGTH = 0
	ZERO_DELIMITED_MESSAGE = 1
)

func AddrTCP(ip string,port int)(*net.TCPAddr, error){
	addr,err := net.ResolveTCPAddr("tcp4",Sprintf("%s:%d", ip, port))
	return addr,err
}

func FixSizeMsg(msg string)([]byte){
	out:=make([]byte, 1024)
	copy(out,msg)
	return out
}

func DelimMsg(msg string)([]byte){
	return []byte(Sprintf("%s\x00",msg))
}

func sendMsg(conn net.Conn, ch chan[]byte, msgType int){
	switch msgType{
	case FIXED_MESSAGE_LENGTH:
		for{
			ch<-FixSizeMsg("Hello World")
			time.Sleep(T_SLEEP)
			conn.Write(<-ch)
		}
	case ZERO_DELIMITED_MESSAGE:
		for{
			ch<-DelimMsg("Hello World")
			time.Sleep(T_SLEEP)
			conn.Write(<-ch)
		}
	}
}

func receiveMsg(conn net.Conn,ch chan[]byte){
	defer conn.Close()
	buf := make([]byte,BUF_SIZE)
	for{
		n, err := conn.Read(buf)
		if err!=nil{
			Println("Error receiving message:\n",err)
			return
		}
		ch<-buf[0:n]
	}
}

func main(){
	addrServer, err := AddrTCP(REMOTE_IP, PORT_FIXED)
	if err != nil {
		Println("Error reading buffer:\n",err)
		return
	}
	
	connTCP, err := net.DialTCP("tcp4",nil,addrServer)
	if err!=nil{
		Println("Error when dialing server:\n",err)
		return
	}
	defer connTCP.Close()

	chanDwn := make(chan[]byte,BUF_SIZE)
	chanUp := make(chan[]byte,BUF_SIZE)
	
	go sendMsg(connTCP, chanUp, FIXED_MESSAGE_LENGTH)
	go receiveMsg(connTCP, chanDwn)

	for{
		select{
			case msg := <-chanDwn:
				Println(string(msg))
		}
	}
}