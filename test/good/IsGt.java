class IsGt {
    public static void main(String[] args) {
        System.out.println(new Main().init());
    }
}

class Main {
    public int init() {
        return this.compare(5, 3);
    }

    public int compare(int x, int y) {
        int res;
        if (x > y) {
            res = 1;
        } else {
            res = 0;
        }
        return res;
    }
}
