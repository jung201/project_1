package aa.exam06;

// 1. 클래스 내부에서 필드, 메서드에 앞에 자동으로 붙는 this 키워드

class A {
	int m;
	int n;

	void init(int a, int b) {
		m = a; // this.m
		n = b; // this.n
	}

	void work() {
		init(2, 3); // this.init ( 2,3 )
	}
}

public class ThisKeyword_1 {
	public static void main(String[] args) {
		
		// 2. 객체 생성
		A a = new A();
		
		// 3. 메서드 호출 / 필드값 활용
		a.work();
		System.out.println(a.m); // 2
		System.out.println(a.n); // 3
	}

}
