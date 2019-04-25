package IO_layer;

import java.util.Queue;

public class main {
    public static void main(String[] args) {
        ContentProvider cp = new ContentProvider();

        Queue<String[]> myQ = cp.getLog("PROFILES");
        int columsNumber = myQ.peek().length;
        int u = 0;
        while(myQ.peek() != null) {
            String[] thisColumn = myQ.poll();

            for (int i = 0; i < columsNumber; i++) {
                System.out.print(".- " + thisColumn[i] + "-.");
            }

            System.out.println("\n new line "+ u++ + "\n");
        }
    }
}
