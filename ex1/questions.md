Exercise 1 - Theory questions
-----------------------------

### Concepts

What is the difference between *concurrency* and *parallelism*?
> You could say concurrency is the software way of simulating hardware parallelism. While parallelism involves using parallel processor cores to execute
> tasks simultaneously, concurrency makes use of software to compute different tasks in the same time period without two tasks actually physically overlapping.

What is the difference between a *race condition* and a *data race*? 
> I understand race conditions to be any situation where the outcome of a program or system is dependant on the time at which the different modules interact with a shared resource.
> For data races, which themselves are a sort of race condition, multiple threads access the same resource at the same time and at least on of them is performing a write operation.
> Both lead to unpredictable behaviour.
 
*Very* roughly - what does a *scheduler* do, and how does it do it?
> A scheduler deals with concurrency on a broad system level, in contrast to my implementation of semaphores in task 4. As in, which thread gets to use the cpu resources at a given time. 


### Engineering

Why would we use multiple threads? What kinds of problems do threads solve?
> Using multiple threads makes the system more effective and responsive. For modern computers with more than one core, efficiency can be greatly improved by utilizing multiple cores at the same time.
> For use in real time systems, it makes sense to use multi-threading, as the machine can do tasks concurrently. A system can read from an IO device, make calculations with the incoming data and write to file, all at once!

Some languages support "fibers" (sometimes called "green threads") or "coroutines"? What are they, and why would we rather use them over threads?
> These are ways to implement concurrency without having to interact with the operating system's low level thread management. You will not be able to utilize multiple cpu cores by using fibers/threads/coroutines.
> In situations where you do not need to interact with hardware through the operating system, and/or want high concurrency with low resource use, using green threads/fibers/coroutines makes sense.

Does creating concurrent programs make the programmer's life easier? Harder? Maybe both?
> It involves a whole new element one wouldn't think about while writing a single thread program. I can see how bugs would appear "out of nowhere" when introducing a whole other dimension to your program.
> For programs where instantaneity is important, and the system that the program might interact with responds better to low delays, having a concurrent program that utilizes multi-threading, definitely makes life easier. 

What do you think is best - *shared variables* or *message passing*?
> I believe both have their pros/cons, and to be completely honest, I don't feel like I have the experience with either to make a clear choice about which is better. With a gun to my head, i would probably choose shared variables, as it is what looks to be closest to the sort of programming I have most experience doing.


