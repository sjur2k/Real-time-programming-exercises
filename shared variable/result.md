Task 3
Since our program is not using mutual exclusivity or similar techniques, we get race conditions and the final value of i is practically random for every execution of the program.

Task 4
I should use mutual exlusivity as we want to guarantee that only one thread is manipulating the value of i at once.