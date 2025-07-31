public class Main {
    public static void main(String[] args) {
        AtomicActionControl actionController = new AtomicActionControl();
        Thread t1 = new Thread(() -> {
            try { actionController.role1(); } catch (Exception e) {}
        });
        Thread t2 = new Thread(() -> {
            try {
                Thread.sleep(2000);
                actionController.role2();
            } catch (Exception e) {}
        });
        Thread t3 = new Thread(() -> {
            try { actionController.role3(); } catch (Exception e) {}
        });
        
        t1.start();
        t2.start();
        t3.start();
    }   
}
