class TestBinOps {
	public static void main(String[] args) {
		System.out.println(new BinOps().start());
	}
}

class BinOps {
	public int start() {
		int a;
		boolean b;
		a = 1 ^ 2;
		System.out.println(a);
		a = 1 & 2;
		System.out.println(a);
		a = 1 | 2;
		System.out.println(a);
		a = 1 / 2;
		System.out.println(a);
		b = true && false;
		if (b) {
			System.out.println(1);
		} else {
			System.out.println(0);
		}
		b = true || false;
		if (b) {
			System.out.println(1);
		} else {
			System.out.println(0);
		}
		b = 1 == 2;
		if (b) {
			System.out.println(1);
		} else {
			System.out.println(0);
		}
		return 0;
	}
}