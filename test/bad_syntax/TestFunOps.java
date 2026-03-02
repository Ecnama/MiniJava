class TestFunOps {
	public static void main(String[] args) {
		System.out.println(new FunOps().start());
	}
}

class FunOps {
	public int start() {
		int a;
		a = (0 - 5) % 2;
		System.out.println(a);
		a = (0 - 5) %% 2;
		System.out.println(a);
		return 0;
	}
}