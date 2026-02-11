class TestIfNoElse {
	public static void main(String[] args) {
		if (1 < 2) {
			if (1 > 2) {
				System.out.println(0);
			}
		} else {
			System.out.println(1);
		}
	}
}