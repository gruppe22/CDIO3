package IO_layer;

import java.util.LinkedList;
import java.util.Queue;

public interface I_ContentProvider {
    LinkedList<String[]> getCommand(String tableName, String category, String content);
    String[] getProfile(String category, String Content);
    boolean isProfile(String tableName, String category, String content);
}
