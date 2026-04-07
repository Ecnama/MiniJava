class TestMultiMain {
    public static void main(String[] args) {
        System.out.println(0);
        System.out.println("Coucou");
        System.out.println(1.2f);
        System.out.println(new Test().test());
        System.out.println(new Test2().test());
        System.out.println(new Test2().test2());
    }
}

class Test {
    public int test() {
        return 42;
    }
}

class Test2 {
    public float test() {
        float a = 3.14f;
        return a;
    }
    public String test2() {
        return "Hello";
    }
}