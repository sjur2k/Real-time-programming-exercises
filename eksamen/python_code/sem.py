import threading
import time

class Barrier:
    def __init__(self,n):
        self.n=n
        self.count=0
        self.mutex=threading.Semaphore(1)
        self.turnstile=threading.Semaphore(0)
        self.turnstile2=threading.Semaphore(0)
    def phase1(self):
        self.mutex.acquire()
        self.count += 1
        if self.count == self.n:
            self.turnstile.release(self.n)
        self.mutex.release()
        self.turnstile.acquire()
    def phase2(self):
        self.mutex.acquire()
        self.count -= 1
        if self.count == 0:
            self.turnstile2.release(self.n)
        self.mutex.release()
        self.turnstile2.acquire()
    def wait(self):
        self.phase1()
        self.phase2()

printMutex = threading.Semaphore(1)
def f1():
    printMutex.acquire()
    print("T1 waiting at",round(time.time()-start_time,1),"s since launch")
    printMutex.release()
    A.wait()
    printMutex.acquire()
    print("T1 let through at",round(time.time()-start_time,1),"s since launch")
    printMutex.release()
    return None
def f2():
    time.sleep(2)
    printMutex.acquire()
    print("T2 waiting at",round(time.time()-start_time,1),"s since launch")
    printMutex.release()
    A.wait()
    printMutex.acquire()
    print("T2 let through at",round(time.time()-start_time,1),"s since launch\n")
    printMutex.release()
    return None

t1 = threading.Thread(target=f1)
t2 = threading.Thread(target=f2)
A = Barrier(2)
start_time=time.time()
t1.start()
t2.start()
t1.join()
t2.join()
