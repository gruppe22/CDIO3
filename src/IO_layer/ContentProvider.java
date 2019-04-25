package IO_layer;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Queue;

public class ContentProvider {

    private LinkedList<String[]> profiles = new LinkedList<>();
    private LinkedList<String[]> produkts = new LinkedList<>();
    private LinkedList<String[]> ingredie = new LinkedList<>();

    public ContentProvider() {
        String[] thisStr = {"Produkts 1", "Produkts 2", "Produkts 3", "Produkts 4", "Produkts 5"};
        produkts.add(thisStr);
        for (int i = 0; i < 100; i++) {
            String[] thisStr2 = {"Row " + i + "column 1", "column 2", "column 3", "column 4", "column 5"};
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
    public LinkedList<String[]> getLog(String informationCategory) {
        switch(informationCategory){
            case "PROFILES":
                return profiles;
            case "PRODUKTS":
                return produkts;
            case "INGREDIENTS":
                return ingredie;
        }
        return null;
    }
}
