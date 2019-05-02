package IO_layer;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Queue;

public class ContentProvider implements  I_ContentProvider {

    private LinkedList<String[]> profiles = new LinkedList<>();
    private LinkedList<String[]> produkts = new LinkedList<>();
    private LinkedList<String[]> ingredie = new LinkedList<>();

    public ContentProvider() {
        String[] thisStr = {"Category 1", "Category 2", "Category 3", "Category 4", "Category 5"};
        produkts.add(thisStr);
        for (int i = 0; i < 100; i++) {
            String[] thisStr2 = {"Row " + i , "column 2", "column 3", "column 4", "column 5"};
            produkts.add(thisStr2);
        }

        String[] thisStrh = {"profiles 1", "profiles 2", "profiles 3", "profiles 4", "profiles 5"};
        profiles.add(thisStrh);
        for (int i = 0; i < 100; i++) {
            String[] thisStr2 = {"Row " + i + "column 1", "column 2", "column 3", "column 4", "column 5"};
            profiles.add(thisStr2);
        }

        String[] thisStrx = {"Ingredie 1", "Ingredie 2", "Ingredie 3", "Ingredie 4", "Ingredie 5"};
        ingredie.add(thisStrx);
        for (int i = 0; i < 100; i++) {
            String[] thisStr2 = {"Row " + i + "column 1", "column 2", "column 3", "column 4", "column 5"};
            ingredie.add(thisStr2);
        }
    }

    public LinkedList<String[]> getCommand(String tableName, String category, String content){

        return produkts;
    }
    public boolean isProfile(String tableName, String category, String content){

        return false;
    }
    public String[] getProfile(String category, String Content){
        return profiles.get(2);
    }
}
