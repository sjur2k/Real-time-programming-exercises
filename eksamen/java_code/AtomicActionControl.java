public class AtomicActionControl implements threeway{
        
    protected Controller control;
        
    public AtomicActionControl(){
        control = new Controller();
    }

    class Controller{
        protected boolean firstHere,secondHere,thirdHere;
        protected int allDone, toExit, numberOfParticipants;
        Controller(){
            firstHere = false;
            secondHere = false;
            thirdHere = false;
            allDone = 0;
            numberOfParticipants = 3;
            toExit = numberOfParticipants;
        }

        synchronized void first() throws InterruptedException{
            while(firstHere) wait();
            firstHere = true;
        }

        synchronized void second() throws InterruptedException{
            while(secondHere) wait();
            secondHere = true;
        }

        synchronized void third() throws InterruptedException{
            while(thirdHere) wait();
            thirdHere = true;
        }
        
        synchronized void finished() throws InterruptedException{
            allDone++;
            if(allDone==numberOfParticipants){
                notifyAll();
            } else while(allDone != numberOfParticipants){
                wait();
            };
            toExit--;
            if(toExit==0){
                firstHere = false;
                secondHere = false;
                thirdHere = false;
                allDone = 0;
                toExit = numberOfParticipants;
                notifyAll();
            }
        }
    }
    
    public void role1(){
        boolean done = false;
        while(!done){
            try {
                control.first();
                done = true;
            } catch (Exception e) {
            // IGNORE
            }
        }
        // DO WORK
        System.out.println("In role 1");
        done = false;
        while(!done){
            try {
                control.finished();
                done = true;                    
            } catch (Exception e) {
                // IGNORE
            }
        }
    }
    public void role2(){
        boolean done = false;
        while(!done){
            try {
                control.second();
                done = true;
            } catch (Exception e) {
            // IGNORE
            }
        }
        // DO WORK
        System.out.println("In role 2");
        done = false;
        while(!done){
            try {
                control.finished();
                done = true;                    
            } catch (Exception e) {
                // IGNORE
            }
        }
    }    
    public void role3(){
        boolean done = false;
        while(!done){
            try {
                control.third();
                done = true;
            } catch (Exception e) {
            // IGNORE
            }
        }
        // DO WORK
        System.out.println("In role 3");

        done = false;
        while(!done){
            try {
                control.finished();
                done = true;                    
            } catch (Exception e) {
                // IGNORE
            }
        }
    }
}