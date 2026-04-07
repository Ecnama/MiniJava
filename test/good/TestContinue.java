class TestContinue {
	public static void main(String[] args) {
		System.out.println(new Continue().start());
	}
}

class Continue {
	public int start() {
		int i = 0;
		while(i < 10) {
			i = i + 1;
			if (i % 2 == 0) {
				continue;
			}
			System.out.println(i);
		}
		return 0;
	}
}