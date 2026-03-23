class TestFloat {
    public static void main(String[] args) {
		System.out.println(new Float().start());
	}
}

class Float {
    public float start() {
        float a;
        float[] b;
        int i;
        a = 1.5f;
        b = new float[3];
        i = 0;
        while (i < 3) {
            b[i] = 1.2f;
            i = i + 1;
        }
        System.out.println(b[2]);
        return a;
    }
}
