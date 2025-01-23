package main

import (
	. "fmt"
	"time"
	"net"
)

const (
	t_sleep time.Duration = time.Second
	bufSize = 1024
	IP="192.168.0.118" //Change this if running at RT-lab
	PortDwn = 20001
	PortUp = 20000
)

func receive_msg(ch chan []byte, conn *net.UDPConn){
	var buff [bufSize]byte
	for{
		n,_,err:=conn.ReadFromUDP(buff[0:])
		if err!=nil{
			Println("Error reading from UDP")
			return
		}
		data := make([]byte, n)
		copy(data, buff[0:n])
		ch<-data
	}	
}

func send_msg(ch chan[]byte, conn *net.UDPConn){
	for{
		_,err:=conn.Write(<-ch)
		if err!=nil{
			Println("Error writing to server:\n",err)
			return
		}
		time.Sleep(t_sleep)
	}
}

func main(){
	chanDwn:=make(chan []byte, bufSize)
	chanUp:=make(chan []byte, bufSize)
	listenAddr , err:= net.ResolveUDPAddr("udp4",Sprintf("%s:%d",IP,PortDwn))
	if err!=nil{
		Println("Error resolving listening address: \n",err)
		return
	}
	dialAddr , err:= net.ResolveUDPAddr("udp4",Sprintf("%s:%d",IP,PortUp))
	if err!=nil{
		Println("Error resolving dialing address:\n",err)
		return
	}

	connDwn,err := net.ListenUDP("udp4",listenAddr)
	if err!=nil{
		Println("Error while listening to server:\n",err)
		return
	}
	defer connDwn.Close()
	
	connUp,err:= net.DialUDP("udp4",nil,dialAddr)
	if err!=nil{
		Println("Error while dialing server:\n",err)
		return
	}
	defer connUp.Close()

	go send_msg(chanUp, connUp)
	go receive_msg(chanDwn, connDwn)
	
	for{
		chanUp<-[]byte("Hello World")
		p:= <-chanDwn
		Printf("%s\n",p)		
	}
}
