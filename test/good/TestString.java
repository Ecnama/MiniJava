class TestString {
    public static void main(String[] args) {
        System.out.println(new StringT().init());
    }
}

class StringT {
    public int init() {
        String s = "Hello, World!";
        System.out.println(s);
        return 0;
    }
}