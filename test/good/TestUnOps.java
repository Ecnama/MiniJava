class TestUnOps {
	public static void main(String[] args) {
		System.out.println(new UnOps().start());
	}
}

class UnOps {
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