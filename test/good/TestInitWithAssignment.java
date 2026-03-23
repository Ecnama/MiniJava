class TestInitWithAssignment {
    public static void main(String[] args) {
        System.out.println(new InitWithAssignmentOps().run());
    }
}

class InitWithAssignmentOps {
    public int run() {
        int x = 40;
        int y = 2;
        float f = 1.5f;
        float g = f;
        System.out.println(g);
        return x + y;
    }
}
