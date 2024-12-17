------ 24.09.03 �ǽ� ------

-- nvl
-- �ش� �÷��� ���� null�� ��쿡 �ٸ� ������� �������� �ϴ� �Լ�

select commission_pct, nvl(commission_pct, 0) as commission2
    from employees;

-- nvl2
-- �ش� �÷��� ���� null �� �ƴ� ���� null �� ��쿡 �ٸ� ������� �������� �ϴ� �Լ�
-- nvl2 ( �÷���, null�� �ƴ� ����� ��, null �� ����� �� )

select commission_pct, nvl ( commission_pct, 0 ) as commission2,
         nvl2 ( commission_pct, commission_pct+0.5, 0 ) as commission3
    from employees;
    
    
-- �Լ�
-- ����� �޿��� ������ ���Ͻÿ�
select sum ( salary ) as "�޿� ����"
    from employees;
    
-- ��� �޿��� ����� ���Ͻÿ�
select avg ( salary ) as "�޿� ���"
    from employees;
    
-- ���� ���̺��� �� ������� ��ȸ
select count ( * ) as "�� �����"
    from employees;

select count ( salary ) as "�� �����"
    from employees;

select count ( hire_date ) as "�� �����"
    from employees;
    
-- max, min
-- �޿��� ���� ���� �ݾ��� ã���ÿ�
select max ( salary )
    from employees;
    
-- �޿��� ���� ���� �ݾ��� ã���ÿ�
select min ( salary )
    from employees;
    
-- abs ���밪 ���
select 10 as ten, -10 as minus_ten, abs(-10) as abs_ten
    from dual;

-- floor : �Ҽ��� �Ʒ��� ����
select floor  ( 11.234 ) as f_col
    from dual;

-- round : �Ҽ��� �ݿø�
select round ( 11.234 ) as r1, round ( 11.128, 2 ) as r2, round ( 11.56 ) as r3
    from dual;
    
-- trunc : �Ҽ��� ����
select trunc ( 123.129 ) as t1, trunc ( 123.129, 2 ) as t2, 
         trunc ( 123.129, -1 ) as t3, trunc ( 11.234 ) as t4
    from dual;
-- -1�� �Ҽ������� �����ڸ��� ����

-- mod : ������ ���ϴ� �Լ�
select mod ( 7 , 2 ) as m1, mod ( 5 , 3 ) as m2
    from dual;
    
-- lower ( �ҹ��� ��ȯ ) , upper ( �빮�� ��ȯ ), initcap ( ù��° �ܾ� �빮�� ������ �ҹ���, ���� ����)
select lower ( 'HELLO db' ) as l1, upper ('HELLO db') as u1, initcap ('HELLO db') as i1
    from dual;
    
-- || , concat ( ���ڿ� ��ħ )
select concat ( 'he' , 'llo' ) as c1, 'he' || 'llo' as c2
    from dual;

-- substr : �κй��ڿ� ����
-- ( �÷���, �����ε��� , ������ �� ���� )
-- �����ε��� : 1������ ���� ( �����ͺ��̽����� �ٸ� )
select substr ( 'Hi Hello Db' , 2 , 4 ) as s1
    from dual;

-- length : ���ڿ� ����
select length ( 'Hi Hello Db' ) as len
    from dual;

-- ltrim ( ���� ���� ���� ) , rtrim ( ������ ���� ���� ) , trim ( ���� ���� ���� ) : �������
select trim ('    hello    ') as t1,
         ltrim ('    hello    ') as t2,
         rtrim ('    hello    ') as t3
    from dual;

select ':'||'    hello    '||':'  as org,
         ':'||trim ( '    hello    ' )||':'  as t1,
         ':'||ltrim ( '    hello    ' )||':'  as t1,
         ':'||rtrim ( '    hello    ' )||':'  as t1
    from dual;

-- instr : Ư�� ���ڿ��� ��ġ�� ã��
select upper ( 'wo Hi HELLO world world' ) as u1,
         instr ( upper ( 'wo Hi HELLO world world' ) , 'WO' , 1, 2) as ins2
    from dual;

-- months_between : �� ��¥��
select sysdate as "���� ��¥", sysdate+60 as "60�� ����",
         months_between ( sysdate+61, sysdate ) as m1,
         months_between ( sysdate, sysdate+61 ) as m2
    from dual;

-- add_months : ���� ����
select add_months ( sysdate, 2 ) as a1
    from dual;

-- next_day : ���� ������ ��¥�� ����
select next_day ( sysdate, 3 ) as n1 
    from dual;

-- 1 : �Ͽ��� , 2 : ������, 3 : ȭ����, 4 : ������ , 5 : ����� , 6 : �ݿ��� , 7 : �����
select next_day ( sysdate, 7 ) as n1 
    from dual;

-- last_day : ���� ���������� ����
select last_day ( sysdate ) as lastday
    from dual;


-- to_char : ���ں�ȯ
-- to_date : ��¥�� ��ȯ
-- to_number : ������ ��ȯ
select sysdate,
         to_char ( sysdate, 'YYYY-MM:DD HH24:MI:SS' ) as ch1,
         to_char ( 560, '$999,999.99' ) as ch2,
         -- �����ϰ� ����ϰ� ������
         to_char ( 560, '$000,000.00' ) as ch3,
         -- �����ϰ� ���ڸ��� �� 0���� ä����
         to_char ( 560 ) as ch4,
         to_date ( '1998:12:25 12:00:00' , 'YYYY-MM:DD HH24:MI:SS' ) as t1,
         to_number ( '123' ) as n1
    from dual;

-- group by : ���� �÷��� ������ �ִ� ���� ������ �׷��� ��ǥ�ϴ� Ư������ ����
-- � �������� �׷��� �������� 

select employee_id, department_id, salary
    from employees;
    
-- �μ���ȣ�� �������� �μ��� ������� �˰�Ͱ� 
-- �μ��� ��� �޿��� �˰� �ʹ�

select employee_id, department_id, salary
    from employees
    order by department_id;
    
select department_id, count ( department_id ) as "�μ��� �����"
    from employees
    group by department_id
    order by department_id
    ;
    
select department_id, 
         count ( department_id ) as "�μ��� �����",
         avg ( salary ) as "�μ��� ��� �޿�"
    from employees
    group by department_id
    order by department_id
    ;

select department_id, 
         count ( department_id ) as "�μ��� �����",
         avg ( salary ) as "�μ��� ��� �޿�",
         max ( salary ) as "�μ��� ���� ���� �޿�",
         min ( salary ) as "�μ��� ���� ���� �޿�"
    from employees
    group by department_id
    order by department_id
    ;
    
-- having : group by�� ������� ������ ����� �� ���� , �׷��� ������ �ٽ� ������ �ɰ� ������
-- ���� where ���ǹ��� �����ϰ� group by�� �׷��� ���� �� �� ������ �׷쿡�� �ٽ� ���ǹ��� �ɰ������
 /*
select * ( �÷� )   -- 5��
from ���̺�        -- 1��
where  ���ǹ�     -- 2��
       .
       .
group by �÷�     -- 3��
having ���ǹ�     -- 4��
order by �÷�      -- 6��
*/
select department_id, --���� �÷�
         count ( department_id ) as "�μ��� �����", -- ���ǹ� 1
         avg ( salary ) as "�μ��� ��� �޿�", -- ���ǹ� 2
         max ( salary ) as "�μ��� ���� ���� �޿�" -- ���ǹ� 3
    from employees -- ���� ���̺�
    group by department_id -- department_id �� �������� �׷�
    having count ( department_id ) > 2 -- department_id �� �������� �׷�� �ȿ��� department_id > 2�� ���� ����
    order by department_id -- department_id �� ������������
    ;

---- join 
/* 
 - ũ�ν� ����
�� ���̺��� ���� �� �ִ� ��� ����
�� ( row ) �� �ೢ�� ����
���� �ٸ� ���̺��� �ೢ�� ���� ��� ����� �� 

 - ���� 
�������� ( inner join )
���� ������ ���� ���� �� �� ���̺��� �ϳ��� �����ͷ� ����

select 
    from a, b
    where a.c3 = b.d1 
-- a���̺��� c3(�Ӽ�)�� b���̺��� d1(�Ӽ�)�� ������
-- from �� �տ� ��ġ�� ( a ) �Ӽ��� �������� �ۼ� ��
-- ���� ���̺��� ������ ( ����, ������ ) �Ӽ����� ���� ( ���� ���� ������ ��ȸ �ȵ� )

�ܺ����� ( outer join ) - ������ vlookup�� ���� 
���� ������ �������� ���� �����ʹ� �ǵ��� �ʰ� ������ �����͸� ����
�������� ���� 

- left join
a left join b on a.c3 = b.d1
������ a ���̺��� �������� ��ȸ ( �������ο��� ��ȸ�� �ȵ� �����ͱ��� ���� )
���� ���� ���� null�� ǥ��

- right join
a right join b on a.c3 = b.d1
�������� a ���̺��� �������� ��ȸ ( �������ο��� ��ȸ�� �ȵ� �����ͱ��� ���� )
���� ���� ���� null�� ǥ��

- full join
a full join b on a.c3 = b.d1
a , b ��� �������� ��ȸ ( �� ���̺��� ���� ���� �ʰų� �޶� ������ ��� )

-- ����
self ���� = ������ ����

*/








