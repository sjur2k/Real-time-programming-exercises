My understanding is ADA's protected object and the Java Monitors do a lot of the work for you, while condition variables are lower level and leave more of the work to the programmer. I suppose this could lead to more errors if the programmer does not know what they are doing.

If it werent for the automatic checking that gives very encouraging thumbs up in the semaphore and condition variable case, i would say that the message passing task is the one that feels the most correct. This is probably just due to the fact that the project was written in Go, and I have never touched D or Ada before.

I could write helper functions that check for higher priorities. The code would surely be a lot uglier, and i would guess in many cases you wouldnt need an arbitrary number of priority levels. You would define N way before release and code thereafter. This limits modulability, but im not sure it matters that much for static programs that dont *need* to change over time.

To avoid race conditions, avoiding reliance on functions like getValue is probably a smart choice. OS portability would likely suffer as well, as Windows semaphores in my experience are finnicky.

I found message passing to be useful during the project. It is very intuitive and debugging was relatively easy. Therefore it is likely the choice i would go for if programming a synchronous project (in Golang) in the future.