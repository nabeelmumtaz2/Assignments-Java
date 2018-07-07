package Database;

public class moreobject {

    public moreobject(String del) {
        this.del = del;
    }

    public static String getDel() {
        return del;
    }

    public void setDel(String del) {
        this.del = del;
    }

    private static String del;
}
