package IO_layer;

import java.util.LinkedList;
import java.util.Queue;

public interface I_ContentProvider {
    LinkedList<String[]> getLog(String informationCategory, String sorting);
    void showEmployeeLog( String typeOfEmployee );
    void showEmployeeLog();
    void showPI();
}
