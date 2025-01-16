// Use `go run foo.go` to run your program

package main

import (
	. "fmt"
	"runtime"
	"sync"
	"time"
)

type SafeCounter struct {
	mu sync.Mutex
}

var i = 0

func incrementing(channel chan int) {
	//TODO: increment i 1000000 times
	for j := 0; j < 1e6; j++ {
		channel <- 1
	}
	close(channel)
}
func decrementing(channel chan int) {
	//TODO: decrement i 1000000 times
	for j := 0; j < 1e6; j++ {
		channel <- 1
	}
	close(channel)
}

func main() {
	// What does GOMAXPROCS do? What happens if you set it to 1?
	runtime.GOMAXPROCS(2)
	chan1 := make(chan int)
	chan2 := make(chan int)
	go incrementing(chan1)
	go decrementing(chan2)
	for chan1 != nil || chan2 != nil {
		select {
		case incr, ok := <-chan1:
			if !ok {
				chan1 = nil
			} else if incr == 1 {
				i += 1
			}
		case decr, ok := <-chan2:
			if !ok {
				chan2 = nil
			} else if decr == 1 {
				i -= 1
			}
		}
	}
	// TODO: Spawn both functions as goroutines
	// We have no direct way to wait for the completion of a goroutine (without additional synchronization of some sort)
	// We will do it properly with channels soon. For now: Sleep.
	time.Sleep(500 * time.Millisecond)
	Println("The magic number is:", i)
}
