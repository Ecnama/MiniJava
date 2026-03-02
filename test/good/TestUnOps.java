class TestFunOps {
	public static void main(String[] args) {
		System.out.println(new FunOps().start());
	}
}

class FunOps {
	public int start() {
		int a;
		boolean b;
		a = -5;
		System.out.println(a);
		b = !true;
		if (b) {
			System.out.println(1);
		} else {
			System.out.println(0);
		}
		return 0;
	}
}