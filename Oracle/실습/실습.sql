-- 24. 08. 30 �ǽ�

-- 1. ȸ��� ���õ� ��� ���� ������ ����

SELECT *
    FROM countries
    ;
    
-- 2. ȸ��� �����ִ� ��� ������ ��� ��ȸ
SELECT * FROM regions;
    
    
-- 3. ȸ��� �����ִ� �μ��� �����ϴ� ��� ���� ������ ��ȸ
SELECT * from locations;

-- 4. ȸ�� ���� �ǹ����� �Ÿ� �ּҸ� ��ȸ
SELECT street_address from locations;

-- ����
-- 1) ȸ�翡 �����ϴ� ��� �۾� ���̵� ��ȸ
SELECT job_id from jobs;

-- 2) ȸ�翡 �����ϴ� ��� ����(����)�� �̸��� ��ȸ
SELECT job_title from jobs;


-- 5. ��� ����� �̸��� ���� ��ȸ
SELECT first_name, last_name
    from employees;
    


-- distinct : �������� �ߺ� ����, �ߺ������ϰ� ���� �÷��� �տ��� �ۼ�
select employee_id
    from job_history;
-- 10�� ��ȸ
    
select distinct employee_id
    from job_history;
-- 7�� ��ȸ
    
-- ����� ����(����) ID�� �ߺ� ���� ��ȸ
select job_id
    from employees;
-- 107�� ��ȸ

select distinct job_id
    from employees;
-- 19�� ��ȸ

-- ����� �����ϴ� ������ ��� ����� �ߺ� ���� ��ȸ
select distinct manager_id
    from employees;

-- ���ǹ� �� ������
-- �ڹٴ� == ������ =
-- not�� != �� ���� <> �� ���� �ǹ�
-- > , >=, <, <=

-- �޿��� 10000�̻��� ����� ���̵�� �̸�, �޿��� ��ȸ
select employee_id, first_name, salary
    from employees
where salary >= 10000;

-- �μ���ȣ�� 50�� ��� ������ ��ȸ
select *
    from employees
where department_id = 50;

-- ���� ���̵� 'AC_MGR' �� ���� ������ ��ȸ
select *
    from jobs
where job_id = 'AC_MGR';

select *
    from jobs
where job_id = 'ac_mgr';


 -- 2024�� 9�� 2��
 -- null �˻�
 
 -- Ŀ�̼��� �ִ� ����� ������ ��ȸ
 SELECT *
    from employees
where commission_pct is not null;

-- ��Ī
select employee_id, first_name, last_name 
    from employees;

select employee_id as "���" , first_name as "�̸�", last_name "��"
    from employees;

-- �÷� ����
-- ����� �޿��� 50% ������ �ݾ� ����� �ʹ�
select employee_id, first_name, last_name, ( salary * 1.5 ) as "�λ��� �޿�"
    from employees;
    
-- between
-- �޿��� 8000 ���� ���ų� ũ�� 10000 ���� ���ų� ���� ����� ������ ��ȸ
select * from employees
    where salary >= 8000 and salary <= 10000;
    
select * from employees
    where salary between 8000 and 10000;

select * from employees
    where salary not between 8000 and 10000;
    
select * from employees
    where salary < 8000 or salary > 10000;
    
-- in, not in
-- job_id 'IT_PROG' , 'SA_REP' , 'HR_REP'
select * from employees
    where job_id in ('IT_PROG' , 'SA_REP' , 'HR_REP' );

select * from employees
    where job_id not in ('IT_PROG' , 'SA_REP' , 'HR_REP' );

-- Ŀ�̼� ������ 0.1 , 0.25 , 0.2 , 0.3 �� �� �ϳ��� ���� ��� ������ ����
select * from employees
    where commission_pct in ( 0.1 , 0.25 , 0.2 , 0.3 ); -- 26��
-- 107 - 26 = 81

select * from employees
    where commission_pct not in ( 0.1 , 0.25 , 0.2 , 0.3 ); -- 9��
    
select * from employees 
    where commission_pct is null; -- 72��

-- like 
-- 'Do' ��� �̸����� �����ϰ� �ش� �̸� �ڷ� 5������ ��� ��� ��ȸ
select * from employees 
    where first_name like 'Do_____';
    
select * from employees 
    where first_name like 'Do%';
    
-- ��ȭ��ȣ�� 011�� �����ϴ� ��� ���� ��ȸ
select * from employees
    where phone_number like '011%';
    
-- �̸��� �ּ� �տ��� 3��° ���ڰ� E�� ��� ������ ����
select * from employees
    where email like '__E%';
    

-- ���� order by
-- default -> asc ( �������� ), ���� ����
-- desc ��������

-- �̸����� �����Ͽ� ��� ��� ������ ����
select * 
    from employees
    order by first_name;
    
-- ��� ���̺��� �μ��� ���� ������ �ϰ� �� ������ Ŀ�̼����� ����
select * 
    from employees
    order by department_id, commission_pct;

-- || concatenation , �÷� ��ġ�� ���

select  first_name || last_name as "full name"
    from employees;
    
-- ����
select first_name, last_name, first_name ||' '|| last_name as "full name"
    from employees;
    
-- �μ��� 80�� �ƴ� ��� ������ ����
select *
    from employees
    where department_id != 80;
    
-- decode
/* decode ( �÷���, ��1, ���氪1, 
                            ��2, ���氪2,
                                  ��������) */

select department_id,
    decode ( department_id, 10, '�����úμ�',
                                      20, '�λ�Ƽ�μ�',
                                      30, 'IT�μ�',
                                      40, '�������μ�',
                                      department_id || '�μ�' ) as deparment_name
    from employees
    order by department_id;
    
-- case when then else and as ����
/*
    case when �÷��� ���ǽ�1 then ��1
           when �÷��� ���ǽ�2 then ��2
           ...
           else �� ���� �� end as ����
*/

select department_id , 
    case when department_id = 10 then '�����úμ�'
            when department_id = 20 then '�λ����μ�'
            when department_id = 30 then 'IT�μ�'
            when department_id = 40 then '�������μ�'
            else department_id || '�μ�' end as deparment_name
    from employees
    order by department_id;



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

-- 24. 09. 04 

-- ��� ��� ������ ��ȸ
select * 
    from employees
    ;
    
-- ��� �μ� ������ ��ȸ
select *
    from departments
    ;

-- �ٸ� ���̺� ���� ( null�� ������ ���� ���� )
select *
    from employees, departments
    where employees. department_id = departments. department_id
    order by employee_id
    ;
    
select *
    from employees emp , departments dep
    where emp. department_id = dep. department_id
    order by employee_id
    ;

-- ���ı����� �� ���̺� ��� �����ϸ� Ư���������
select *
    from employees emp , departments dep
    where emp. department_id = dep. department_id
    order by emp.department_id
    ;

-- �μ��� 100�� ����� �̸��� �μ��̸��� ��ȸ
select emp.first_name , dep.department_name
    from employees emp, departments dep
    where emp.department_id = dep.department_id
        and emp.department_id = 100
    ;

-- �޿��� 10000 ������ ����� ���, �޿�, �μ��̸��� ������� ����
select e.employee_id , e.salary, d.department_name
    from employees e , departments d
    where e.department_id = d.department_id
    and e.salary <= 10000
    order by employee_id
    ;
    
select 
    e.employee_id , e.salary, d.department_name
from 
    employees e join departments d on 
    e.department_id = d.department_id and e.salary <= 10000
 order by employee_id
 ;
 
select 
    e.employee_id , e.salary, d.department_name
from 
    employees e join departments d on 
    e.department_id = d.department_id 
where e.salary <= 10000
order by employee_id
 ;

-- ����� ���, �޿�, ���� �̸�, �ش� ������ �ּ� �޿�, �ִ� �޿� ������ ��ȸ
select 
    e.employee_id , e.salary ,  j. job_title , j.min_salary ,  j.max_salary
    from employees e , jobs j
    where e.job_id = j.job_id
    order by employee_id
    ;

select 
    e.employee_id , e.salary ,  j. job_title , j.min_salary ,  j.max_salary
    from employees e join jobs j on e.job_id = j.job_id
    order by employee_id
    ;


-- ����� ������ ��� ��ȸ�� �ǰ� �μ� �̸��� ��ȸ
select
    e.employee_id , e.first_name , d.department_name
from 
    employees e left join departments d on e.department_id = d. department_id
order by 
    employee_id
;

-- join on�� ������� �ʰ� , �� ���� �÷��� ������ �ƴ� ���̺� �ڿ� (+)�� ���δ�
select
    e.employee_id , e.first_name , d.department_name
from 
    employees e , departments d
where    
    e.department_id = d. department_id(+)
order by 
    employee_id
;

-- �μ� ������ �� ���� �Ͱ�, �� �μ��� �ش��ϴ� ����� ��� , �̸� ��ȸ
select
    d.* , e.employee_id , e.first_name
from
    departments d left join employees e on d.department_id = e.department_id
order by d.department_id
;

-- ��������
-- ���� ���̵� 1700�� �μ��鿡�� ������ �ʴ� ��� ���� ��ȸ
select *
from employees
where department_id not in 
        ( select department_id 
          from departments
          where location_id = 1700)
order by employee_id
;

select *
from employees e join departments d on e.department_id = d.department_id
where d.location_id != 1700
order by e.employee_id
 ;

-- �ִ� �޿��� �޴� ����� ������ ���
select *
    from employees
    where salary = 
    ( select 
        max ( salary ) 
        from employees )
;

-- ��� �޿����� �� ���� �޴� ����� ���� ��ȸ
select *
    from employees
    where salary > 
    ( select
        avg ( salary )
        from employees )
;
    
-- ������ �߰�
-- inser into ���̺�� ( �÷���1, �÷���2 ... )
--                 values ( ��1.        ��2,      ...) ; 

insert into 
employees (employee_id, first_name, last_name, email, hire_date, salary, job_id)
values 
( 1000, 'JungGyu' , 'Lee' , 'junggyu@junggyu.com' , '2024-09-04' ,10000 ,'IT_PROG' )
;

select 
    employee_id
    from employees;

-- 17�� �Է�

insert into 
employees (employee_id, first_name, last_name, email, hire_date, salary, job_id)
values 
( 1000, 'JungGyu' , 'Lee' , 'junggyu@junggyu.com' , '2024-09-04' ,10000 ,'IT_PROG' )
;
insert into 
employees (employee_id, first_name, last_name, email, hire_date, salary, job_id)
values 
( 1001, 'NamHee' , 'Shim' , 'NamHee@human.com' , '2024-09-04' ,500 ,'IT_PROG' )
;

insert into 
employees (employee_id, first_name, last_name, email, hire_date, salary, job_id)
values 
( 1002, 'Byeong Jin' , 'Seol' , 'Byeong@human.com' , '2024-09-04' ,500 ,'IT_PROG' )
;

insert into 
employees (employee_id, first_name, last_name, email, hire_date, salary, job_id)
values 
( 1003, 'JinBae' , 'Moon' , 'JinBae@human.com' , '2024-09-04' ,500 ,'IT_PROG' )
;

insert into 
employees (employee_id, first_name, last_name, email, hire_date, salary, job_id)
values 
( 1004, 'HyunSeop' , 'Park' , 'HyunSeop@human.com' , '2024-09-04' ,500 ,'IT_PROG' )
;

insert into 
employees (employee_id, first_name, last_name, email, hire_date, salary, job_id)
values 
( 1005, 'JiHoon' , 'Jeon' , 'JiHoon@human.com' , '2024-09-04' ,500 ,'IT_PROG' )
;

insert into 
employees (employee_id, first_name, last_name, email, hire_date, salary, job_id)
values 
( 1006, 'TaeWoong' , 'Lee' , 'TaeWoong@human.com' , '2024-09-04' ,500 ,'IT_PROG' )
;

insert into 
employees (employee_id, first_name, last_name, email, hire_date, salary, job_id)
values 
( 1007, 'YongJun' , 'Jo' , 'YongJun@human.com' , '2024-09-04' ,500 ,'IT_PROG' )
;

insert into 
employees (employee_id, first_name, last_name, email, hire_date, salary, job_id)
values 
( 1008, 'SeoHyeon' , 'Kim' , 'SeoHyeon@human.com' , '2024-09-04' ,550 ,'IT_PROG' )
;

insert into 
employees (employee_id, first_name, last_name, email, hire_date, salary, job_id)
values 
( 1009, 'SoonGu' , 'Kang' , 'SoonGu@human.com' , '2024-09-04' ,500 ,'IT_PROG' )
;

insert into 
employees (employee_id, first_name, last_name, email, hire_date, salary, job_id)
values ( 1010, 'Gunwoo' , 'Kim' , 'Gunwoo@human.com' , '2024-09-04' ,500 ,'IT_PROG' )
;

insert into 
employees (employee_id, first_name, last_name, email, hire_date, salary, job_id)
values 
( 1011, 'SiHoo' , 'Lim' , 'SiHoo@human.com' , '2024-09-04' ,500 ,'IT_PROG' )
;


insert into 
employees (employee_id, first_name, last_name, email, hire_date, salary, job_id)
values 
( 1012, 'Hyemin' , 'Kim' , 'Hyemin@human.com' , '2024-09-04' ,500 ,'IT_PROG' )
;

insert into 
employees (employee_id, first_name, last_name, email, hire_date, salary, job_id)
values 
( 1013, 'SangMin' , 'Yun' , 'SangMin@human.com' , '2024-09-04' ,500 ,'IT_PROG' )
;

insert into 
employees (employee_id, first_name, last_name, email, hire_date, salary, job_id)
values 
( 1014, 'SangHyoung' , 'Lee' , 'SangHyoung@human.com' , '2024-09-04' ,500 ,'IT_PROG' )
;

insert into 
employees (employee_id, first_name, last_name, email, hire_date, salary, job_id)
values 
( 1015, 'HeeCheol' , 'Shin' , 'HeeCheol@human.com' , '2024-09-04' ,500 ,'IT_PROG' )
;

insert into 
employees (employee_id, first_name, last_name, email, hire_date, salary, job_id)
values 
( 1016, 'SooSin' , 'Park' , 'SooSin@human.com' , '2024-09-04' ,600 ,'IT_PROG' )
;

insert into 
employees (employee_id, first_name, last_name, email, hire_date, salary, job_id)
values 
( 1017, 'MinSu' , 'Lee' , 'MinSu@human.com' , '2024-09-04' ,500 ,'IT_PROG' )
;
select *
    from employees
    where employee_id >= 1000;


update employees set salary = '100000' where employee_id = 1000 ;


-- ����� 1000�̻��� ���������׸� ���� 10% �λ�
update employees
    set salary = salary * 1.1
    where employee_id >= 1000
;

-- ����� 1000�̻��� ���������׸� Ŀ�̼� 0.2 �λ�
update employees
    set commission_pct = 0.2
    where employee_id >= 1000
;

-- ���� : ���� ����
insert into 
employees (employee_id, first_name, last_name, email, hire_date, salary, job_id)
values 
( 2000, 'temp' , 'temp' , 'temp' , '2024-09-04' ,500 ,'IT_PROG' )
;

-- delete
    from employees 
    where employee_id = 2000
;
-- 2000	temp	temp	temp		2024-09-04	IT_PROG	500			

select *
    from employees 
    where employee_id = 2000
;


-- 24-09-05
--------------------------------------------------------------------------------

-- �л� ���̺� 
create table H_Student (
    s_id number primary key, 
    s_name varchar2(20) not null,
    s_telephone varchar2(13),
    s_birth varchar2(10),
    s_email varchar2(50),
    s_c_id number
);

-- �ּ�(����) �߰�
alter table H_Student
add s_address varchar2(255);

comment on column H_Student. s_id is '�л�ID' ;
comment on column H_Student. s_name is '�л� �̸�' ;
comment on column H_Student. s_telephone is '�л� ��ȭ��ȣ' ;
comment on column H_Student. s_birth is '�л� �������' ;
comment on column H_Student. s_email is '�л� �̸��� ' ;
comment on column H_Student. s_c_id is '�л� ���ǰ��� ID (H_Class)' ;
comment on column H_Student. s_address is '�л� �ּ� ' ;

--------------------------------------------------------------------------------

-- ���ǽ� ���̺� 
create table H_Classroom (
    r_id number primary key, 
    r_num varchar2(3) not null,
    r_loc varchar2(5)
);

-- r_num �� null�� ���� (�ɼǺ���)
alter table H_Classroom
modify (r_num varchar2(3) null);

comment on column H_Classroom. r_id is '������ ID' ;
comment on column H_Classroom. r_num is '������ �� ��ȣ' ;
comment on column H_Classroom. r_loc is '������ ��ġ' ;

--------------------------------------------------------------------------------

-- ���ǰ��� ���̺�
create table H_Class (
    c_id number primary key, 
    c_name varchar2(100) not null,
    c_desc varchar2(300),
    c_startdate date,
    c_enddate date,
    c_r_id number
);

-- c_desc ==> c_descriotion ( �̸����� )
alter table H_Class rename column c_desc to c_descriotion;

-- Ÿ�Ժ���
alter table H_Class
modify c_descriotion varchar2(500)
;

-- ���̺� ����
drop table H_Class;

-- ���̺� ���� ����
create table H_Class (
    c_id number primary key, 
    c_name varchar2(100) not null,
    c_descriotion clob, -- ( ���� )
    c_startdate date,
    c_enddate date,
    c_r_id number
);

comment on column H_Class. c_id is '���ǰ��� ID' ;
comment on column H_Class. c_name is '���ǰ�����' ;
comment on column H_Class. c_descriotion is '���Ǽ���' ;
comment on column H_Class. c_startdate is '������' ;
comment on column H_Class. c_enddate is '������ ' ;
comment on column H_Class. c_r_id is '������ ID (H_Classroom)' ;

--------------------------------------------------------------------------------
