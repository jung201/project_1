package a.textexam.exam_2;

public class SavingAccount extends BankAccount {
	private double interestRate;

	// SavingAccount 생성자
	public SavingAccount(String ownername, double balance, double interestRate) {
		super(ownername, balance);
		if (interestRate < 0) {
			throw new IllegalArgumentException("이자율은 0 이상이어야 합니다");

		}
		this.interestRate = interestRate;
	}

	// 이자 추가 메서드
	public void addInterest() {
		double interest = balance * interestRate / 100;
		balance += interest;
		System.out.println("이자가 추가되었습니다 : " + interest + "원. 현재 잔액 : " + balance);
	}
}
