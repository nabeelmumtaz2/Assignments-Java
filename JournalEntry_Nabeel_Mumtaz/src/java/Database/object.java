package Database;

import java.sql.Timestamp;

public class object {

    private static String entry;
    private static String content;

    public object(String entry, String content) {
        this.entry = entry;
        this.content = content;

    }

    public static String getEntry() {
        return entry;
    }

    public void setEntry(String entry) {
        this.entry = entry;
    }

    public static String getcontent() {
        return content;
    }

    public void setcontent(String content) {
        this.content = content;
    }

}
