package a.textexam.exam_2;

public class BankAccount {

	// 필드 생성
	protected String ownerName;
	protected double balance;

	// 기본 생성자
	public BankAccount() {
		this.ownerName = "Unknown";
		this.balance = 0;
	}

	// 매개변수 있는 생성자
	public BankAccount(String ownerName, double balance) {
		this.ownerName = ownerName;
		if (balance < 0) {
			throw new IllegalArgumentException("초기 잔액은 0 이상이어야 합니다.");
		}
		this.balance = balance;
	}

	// 입금 메서드
	public void deposit(double amount) {
		if (amount <= 0) {
			throw new IllegalArgumentException("입금 잔액은 0보다 커야 합니다");
		}
		balance += amount;
		System.out.println(amount + "원이 입금되었습니다. 현재 잔액 : " + balance + "원");
	}

	public void withdraw(double amount) {
		if (amount <= 0) {
			throw new IllegalArgumentException("출금액은 0보다 커야 합니다");

		} else if (amount > balance) {
			throw new IllegalArgumentException("잔액이 부족합니다");
		}
		balance -= amount;
		System.out.println(amount + "원이 출금되었습니다. 현재 잔액 : " + balance + "원");
	}

}
