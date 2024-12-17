package a.textexam.exam_2;

public class BankAccountTest {
    public static void main(String[] args) {
        try {
            // 기본 계좌 생성 및 테스트
            BankAccount account1 = new BankAccount("Alice", 1000);
            account1.deposit(1000);
            account1.withdraw(200);
            account1.withdraw(1500);  // 예외 발생: 잔액 부족

        } catch (IllegalArgumentException e) {
            System.out.println("예외 발생: " + e.getMessage());
        }

        try {
            // 예금 계좌 생성 및 테스트
        	SavingAccount savingsAccount = new SavingAccount("Bob", 2000, 5);
            savingsAccount.deposit(300);
            savingsAccount.withdraw(500);
            savingsAccount.addInterest();
            savingsAccount.withdraw(-100);  // 예외 발생: 유효하지 않은 출금액

        } catch (IllegalArgumentException e) {
            System.out.println("예외 발생: " + e.getMessage());
        }
    }
}