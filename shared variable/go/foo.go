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

func (c *SafeCounter) incrementing() {
	//TODO: increment i 1000000 times
	for j := 0; j < 1000000; j++ {
		c.mu.Lock()
		i += 1
		c.mu.Unlock()
	}
}
func (c *SafeCounter) decrementing() {
	//TODO: decrement i 1000000 times
	for j := 0; j < 1000000; j++ {
		c.mu.Lock()
		i -= 1
		c.mu.Unlock()
	}
}

func main() {
	// What does GOMAXPROCS do? What happens if you set it to 1?
	runtime.GOMAXPROCS(2)
	c := SafeCounter{}
	go c.incrementing()
	go c.decrementing()
	// TODO: Spawn both functions as goroutines
	// We have no direct way to wait for the completion of a goroutine (without additional synchronization of some sort)
	// We will do it properly with channels soon. For now: Sleep.
	time.Sleep(500 * time.Millisecond)
	Println("The magic number is:", i)
}
