class TestDoWhile {
    public static void main(String[] args) {
        System.out.println(new Main().init());
    }
}

class Main {
    public int init() {
        return this.createArray(42)[3];
    }

    public int[] createArray(int n) {
        int[] a = new int[n];
        int i = 0;
		do {
			a[i] = i;
			i = i + 1;
		} while (i < n);
        return a;
    }
}