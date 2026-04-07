class TestFor {
    public static void main(String[] args) {
        System.out.println(new Main().init());
    }
}

class Main {
    public int init() {
        return this.createArray(42)[3];
    }

    public int[] createArray(int n) {
        int[] a;
        int i;
        a = new int[n];
        for (i = 0; i < n; i = i + 1) {
            a[i] = i;
            if (i == 10) {
                break;
            }
        }
        return a;
    }
}