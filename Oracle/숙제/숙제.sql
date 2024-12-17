-- 240830 ����

-- 1) ȸ�翡 �����ϴ� ��� �۾� ���̵� ��ȸ
SELECT job_id from jobs;

-- 2) ȸ�翡 �����ϴ� ��� ����(����)�� �̸��� ��ȸ
SELECT job_title from jobs;

-- 3) ����� ����� �̸����� ��ȸ
select employee_id, email from employees;

-- 4) ���� �̷¿� �ִ� ������� ���, ���� ������, �۾� ������ ��ȸ
select employee_id, start_date, end_date from job_history;

-- 5) ������ ������, �ּ� �޿�, �ִ� �޿��� ��ȸ
select job_title, min_salary, max_salary from jobs;

-- 6) ����� ���� ���̵� (����)�� �޿��� ��ȸ�ϰ� �ߺ��� ��� ���� ���� ������ ���̸� �˾ƺ�����
select job_id, salary
    from employees;
-- 107��

-- 7) ���� ���̵� 'FI_ACCOUNT' �� �ƴ� �������̵� ������ ��ȸ
select *
    from jobs
where job_id != 'FI_ACCOUNT';

-- 8) 2003�� 9�� 17�� ���Ŀ� �Ի��� ����� ���, �����, ��ȭ��ȣ�� ����
select employee_id, hire_date, phone_number
    from employees
where hire_date > '2003-09-17';


----------------------------------------------------------------------------------------------
-- 24. 09. 02 ����
-- 1) �μ��� �������� ���� ����� ��ȸ

select *
    from employees
    where department_id is null;
    
-- 2) Ŀ�̼��� �ִ� ��� �� �޿��� 10000�̻� �� ����� ������ ��ȸ
select *
    from employees
    where commission_pct is not null and salary >= 10000;

-- 3) �޿��� 7000 �̸��̰ų� 10000 �ʰ��� ��� ������ ����
select *
    from employees 
    where salary < 7000 or salary > 10000;
select * 
    from employees 
    where salary not between 7000 and 10000;

-- 4) ����� �̸��� E,G �� �����ϴ� ��� ������ ��ȸ
select * 
    from employees 
    where first_name between 'E' and 'H' ;
    
select * 
    from employees 
    where first_name >= 'E' and first_name < 'H';

-- 5) ����� �Ի����� 2004�� 5�� 20�� ~ 2007�� 10�� 9�� ���������� ��� ������ ��ȸ
select * 
    from employees 
    where hire_date >= '2004-5-20' and hire_date < '2008-01-13';
    
select * 
    from employees 
    where hire_date between '2004-5-20' and '2008-01-12';

-- 6) ��� ���̵� ( region_id ) �� 1, 3, 4 �� �ƴ� ���� ������ ��ȸ
select *
    from countries 
    where region_id not in ( 1, 3, 4 );

-- 7) �μ��� 80 , 50, null �� ��� ������ ��ȸ
select * 
    from employees
    where department_id in ( 80 , 50 ) or department_id is null;

-- 8) job_title �� 'Account' �� ����ִ� ���� ���� ��ȸ
select * 
    from jobs
    where job_title like '%Account%';

-- 9) ��ȭ��ȣ 1343. �� ���� ���� ��� ���� ��ȸ
select *
    from employees
    where phone_number not like '%. 1343.%';

-- 10) �̸��� ���ĺ� a, A �� ����ִ� ��� ���� ��ȸ
select * 
    from employees
    where first_name like '%a%' or first_name like '%A%' ;

-- 11) ���ĺ� ������������ ���� �̸��� �����Ͽ� ���� ������ ����
select * 
    from countries
    order by country_name asc;
    
-- 12) ��� �̷� ���̺��� ����� ������������ ����, ������� ������ �Ի��� ������������ ����
select * 
    from job_history
    order by end_date , start_date desc;
    
-- 13) �޿��� ������������ ����, ������ Ŀ�̼� ������ ������������ ���� �� ��� ������ ��ȸ
select * 
    from employees
    order by salary desc , commission_pct ;
    
-- 14)
-- ����� Ŀ�̼��� 0.1 �����̸� ��, 
-- 0.2 �����̸� ��
-- 0.2 �ʰ��̸� ��
-- null ����̸� null
-- �� ���� ����̸� '���ù��� ���� ������'
-- ��� commission_pct_name���� ���, employee_id, first_name, commission_pct ��ȸ

select employee_id, first_name,commission_pct,
    case when commission_pct <= 0.1 then '��'
            when commission_pct <= 0.2 then '��'
            when commission_pct  > 0.2 then '��'
            when commission_pct  is null then 'null'
            else  '���ù��� ���� ������' end as commission_pct_name
    from employees
order by commission_pct
;


----------------------------------------------------------------------------------------------


-- 24. 09. 03 ����

-- 1) ��� ���̺��� ������ ��ȸ ( �𸣸� �˻� )
    desc emp;

-- 2) �μ� ���̺��� ������ ��ȸ ( �𸣸� �˻� )
    desc dept;

-- 3) ��� �μ� ������ ����
select *
    from dept;
    
-- 4) ��� ��� ������ ��ȸ
select *
    from emp;
    
-- 5) ��� ����� �̸��� ��ȸ
select ename
    from emp;

-- 6) ȸ���� �μ���ȣ�� ��ȸ
select deptno
    from dept;

-- 7) ����� ������, �޿�, Ŀ�̼��� ��ȸ
select job, sal, comm
    from emp
    where job = 'MANAGER';
.
.
select mgr, sal, comm from emp; 

-- 8) �μ��� �̸��� ������ ��ȸ
select dname, loc
    from dept;

-- 9) �޿� ��ް� ���� �޿��� ��ȸ
select grade, losal
    from salgrade;

-- 10) ȸ�翡 �����ϴ� ����� �۾��� ��ȸ
select job
    from emp;

-- 11) ����� �����ϴ� �μ���ȣ�� �ߺ����� ��ȸ
select distinct deptno
    from emp;

-- 12) �����ϴ� ����� �����ϴ� ������ ���̵� �ߺ����� ��ȸ
select distinct mgr
    from emp
    where mgr is not null;

-- 13) �޿� ����� 3�� �� ���� �� �ִ� �ִ� �޿�, �ּ� �޿��� ��ȸ
select hisal, losal
    from salgrade
    where grade = 3;

-- 14) �޿��� 2100�̻��� ����� ������ ��ȸ
select *
    from emp
    where sal >= 2100;

-- 15) �μ��� 20�� ������ ���ϴ� ������� ��� ������ ��ȸ
select *
    from emp
    where deptno = 20;
    
-- 16) �����ڰ� ���� ����� ������ ��ȸ
select *
    from emp
    where mgr is null ; 

-- 17) Ŀ�̼��� ���� ����� ������ ��ȸ
select *
    from emp
    where comm is null;

-- 18) ����� �޿��� 50�� ������ �÷��� ����� ��ȸ
select sal+50 as "�޿�50�λ�"
    from emp;

-- 19) ����� �޿����� 10%������ �÷��� ����� ��ȸ
select sal * 1.1 as "�޿�10%����"
    from emp;

-- 20) ����� �޿��� 50�� ������ �÷����� upgradeSalary�� �ؼ� ��ȸ
select sal + 50 as upgradeSalary
    from emp;

-- 21) ����� �޿��� Ŀ�̼��� ���� �÷����� upgradeSalary�� �ؼ� ��ȸ
select sal ||' '|| comm as upgradeSalary
    from emp;
.
.
select sal, comm, sal+nvl(comm,0) as upgradeSalary from emp; 

-- 22) 'XXXx ����� ����� �����ڰ� xxx��� �Դϴ�' ������ ���°� ������ �÷��� ����� ��ȸ
select empno ||''|| ('����� ����� �����ڰ�') ||''|| mgr || ('����Դϴ�') as "���"
    from emp;

-- 23) �����ڰ� ���� ����� �����̴�. ������ ������ ��ȣ�� 9999�� ����� �ǵ��� 
--       nvl, nvl2, decode �Լ��� �̿��ؼ� ���� �������� ������ּ���
select mgr, nvl(mgr, 9999) 
    from emp;
    
select mgr, nvl(mgr, 9999),
            nvl2(mgr, mgr, 0)
    from emp;

select mgr, decode ( mgr,null,999 )
    from emp;

-- 23,24�� ������ nvl, nvl2�� ���� ���� ����
-- 24) �߰��� ���޵Ǵ� Ŀ�̼��� ������ 0���� ��ȸ�� �ǵ��� ��ȸ
select nvl(comm, 0) as comm
    from emp;
    
-- 25) �޿��� 800���� ���ų� ���� 1000���� ���ų� ���� ����� ������ ��ȸ
select *
    from emp
    where sal >= 800 and sal <= 1000;

-- 26) �μ� ��ȣ�� 20�̸鼭 ������ MANAGER�� ��� ������ ��ȸ
select *
    from emp
    where deptno = '20'; and job = 'MANAGER';
    
-- 27) �μ� ��ȣ�� 20�̰ų� ������ manager�� ��� ������ ��ȸ
select *
    from emp
    where deptno = '20' or job = 'manage';

-- 28) ������ manager �� �ƴ� ��� ������ ��ȸ
select *
    from emp
    where job != 'MANAGER';

-- 29) Ŀ�̼��� 0, 500, 1400�� ���� ��� ������ ��ȸ
select *
    from emp
    where comm in ( 0, 500, 1400 );

-- 30) �޿��� 700���� �۰ų� 1000���� ū ��� ������ ��ȸ
select *
    from emp
    where sal < 700 or sal >1000
    order by sal;
.
.
select * from emp where sal not between 700 and 1000; 

-- 31) ����� �̸��� SCOTT �� ��� ������ ��ȸ
select *
    from emp
    where ename = 'SCOTT';
    
-- 32) ��� �̸��� 'A' �� �����ϴ� ��� ������ ��ȸ
select *
    from emp
    where ename like 'A%';
    
-- 33) �̸��� S �� ���� ��� ������ ��ȸ
select * 
    from emp
    where ename like '%S%';
    
-- 34) �̸��� L �� ���� �ʴ� ��� ������ ��ȸ
select * 
    from emp
    where ename not like '%L%';
    
-- 35) �̸��� ����° ���ڰ� I(���ĺ� �빮�� ����) �� ��� ������ ��ȸ
select *
    from emp
    where ename like '__I%';
    
    
-- 36) ����� �̸��� E~G�� �����ϴ� ��� ������ ��ȸ
select *
    from emp
    where ename >= 'E' and ename < 'H';
.
.
select * from emp where ename between 'E' and 'H' and ename != 'H'; 

-- 37) ����� �Ի����� 1981�� 2�� 20�� ~ 1982�� 1�� 23�ϱ��� ��� ������ ��ȸ
select *
    from emp
    where hiredate >= '1981-02-20' and hiredate <= '1982-01-23';
.
.
select * from emp where hiredate between '1981-02-20' and '1982-01-23'; 

-- 38) �Ի����� 83�� ���� �̰ų� job �� SALESMAN�� ��� ����� ��ȸ
select *
    from emp
    where hiredate > '1983-12-31' or job = 'SALESMAN';
    
-- 39) 20�� �μ��� �ƴ� ��� ����� ������ ��ȸ
select *
    from emp
    where deptno != 20;

-- 40) �޿��� 600���� 3000 ���̰� �ƴ� ����� ������ ��ȸ
select *
    from emp
    where sal  >= 600 and not sal <= 3000;
.
.
    
select * from emp where sal not between 600 and 3000; 

-- 41) ��簡 ���� ����� ��ȸ
select *
    from emp
    where mgr is null;
    
-- 42) �Ŵ����� 7782,2902,2698,7566 �� ��� ������ ��ȸ
select * 
    from emp
    where mgr in ( 7782,2902,2698,7566 ) ;
    
-- 43) �μ� ��ȣ�� 40,10,20 �� �ƴ� ��� ������ ��ȸ
select *
    from emp
    where deptno not in ( 40, 10, 20 );
    
-- 44) ����� �̸��� 5 ������ ��� ������ ��ȸ
select *
    from emp
    where ename like '_____';
    
-- 45) ������ N ���� ������ ��� ������ ��ȸ
select * 
    from emp
    where job like '%N';
    
-- 46) ������ ��ȣ�� ������������ �����Ͽ� ��� ������ ��ȸ
select * 
    from emp
    order by mgr desc;
    
-- 47) �޿��� ���� ������ ��� ������ ��ȸ
select * 
    from emp
    order by sal desc;
    
-- 48) ���, �̸�, �����ڹ�ȣ, �޿� ������ ��ȸ�� �� ������ ��ȣ�� ��������, �μ���ȣ�� ������������ 
--      �����Ͽ� ��� ���� ��ȸ
select empno, ename, mgr, sal
    from emp
    order by mgr, deptno;
 
 
-- 49) ������ 'SALESMAN' �̸� 15%, 'MANAGER' �̸� 10%, �̿��� ������ 5% �޿��� �λ��Ͽ� ��� ������ ��ȸ
select job, sal, decode ( job, 'SALESMAN', sal*1.5, 'MANAGER', sal*1.1, sal*1.05) as "�޿��λ�"
    from emp;
.
.
select 
case when job='SALESMAN' then sal1.5
       when job='MANAGER' then sal1.1
        else sal*1.05 end as updateSalary 
    from emp; 

-- human �����ͺ��̽����� Department, Professor, Course , Student, SG_Scores ���̺��� ��ȸ �� �ּ��� 
-- 50) Department ���̺��� ��� �����͸� ��ȸ
select *
    from department;
    
-- 51) Professor ���̺��� �ߺ� ���� ���� Dept_ID �÷��� ������ ��ȸ
select distinct dept_id
    from professor;
    
-- 52) Professor ���̺��� �ߺ� ���� ���� Dept_ID �÷��� ������ ��ȸ. ��,�÷����� �Ҽ��а�
select distinct dept_id as "�Ҽ��а�"
    from professor;

-- 53) Course ���̺��� �����ڵ�(course_id), �����(title), ������(c_number) �� ��ȸ
select course_id, title, c_number
    from course;

-- 54) Course ���̺��� �����ڵ�(course_id), �����(title), ������(c_number) �� �����(title) ������������ ��ȸ
select course_id, title, c_number
    from course
    order by title;
    
-- 55) Course ���̺��� �����ڵ�(course_id), �����(title), ������(c_number), ���� ������
--      (������ * 30000 + �߰�������) �� ��ȸ�ϵ�, ���� �����Ḧ ��������, �����ڵ�� ������������ ��ȸ
select course_id, title, c_number, course_fees
    from course;
    
select course_id, title, c_number, ( c_number * 30000 ) + nvl(course_fees, 0)  as �߰�������
    from course
    order by ( c_number * 30000 ) + nvl(course_fees, 0) desc, course_id asc;
    
.
.
select course_id as "�����ڵ�", title as "�����", c_number as "������", 
c_number30000 + nvl(course_fees, 0) as "���� ������"  
from Course 
order by  c_number30000 + nvl(course_fees, 0) desc, course_id; 

    
-- 56) Professor ���̺��� '�İ�'�а��� �������� ��ȸ
select
    Professor_ID,
    Position,
    name
    from professor
    where dept_id = '�İ�';

.
.
select Professor_ID, name, Position, dept_id from Professor where dept_id = '�İ�'; 
    
    
-- 57) Course ���̺�κ��� �߰� �����ᰡ 30000�� �̻��� ������� ��ȸ�ϵ�, �߰� �����Ḧ ������������ ��ȸ
select course_fees
    from course
    where course_fees >= 30000 
    order by course_fees desc;
.
.
select * 
    from Course 
    where course_fees >= 30000 
    order by course_fees desc; 


-- 58) Student ���̺��� '�İ�' �а� 2�г� �л��� �а�, �г�, ������ ��ȸ
select dept_id, year, name
    from student
    where dept_id in ( '�İ�' ) and year in ( '2' );
    

-- 59) Professor ���̺�� �����͸� ��ȸ�� �� 'XXX �а� XXX(�̸�)  XXX(����)�� ��ȭ��ȣ�� XXX �̴� '  
--      ������ ���°� ������ �÷��� ����� ��ȸ, �а��ڵ�(dept_id) ������ ����
select dept_id ||''|| '�а�' ||' '|| name ||' '|| position ||'�� '|| '��ȭ��ȣ��'||' '||telephone||'�̴�' 
    from professor
    order by dept_id;

-- 60) Student ���̺��� '��' �� ���� ���� �л� ����� ��ȸ
select *
    from student
    where name like '��%';
    
-- 61) Student ���̺��� �̸��� �߰� ���ڰ� '��' �� �� �л��� ��ȸ
select *
    from student
    where name like '%��%';
    
-- 62) Student ���̺��� '��', '��' �� ���� ������ �л� ����� ��ȸ
select *
    from student
    where name not like '��%' and name not like '��%';

-- 63) Professor ���̺��� �а� �ڵ尡 '�İ�', '����', �а��� ���� ���� ���� ����� �а��ڵ� ������ ��ȸ
select *
    from professor
    where dept_id in ( '�İ�' ,'����' ) and position like '%����%'
    order by dept_id;
    
-- 64) Professor ���̺��� �а� �ڵ尡 '�İ�', '����', �а��� �ƴ� ���� ����� �а��ڵ� ������ ��ȸ
select *
    from professor
    where dept_id not in ( '�İ�' ,'����' ) and position like '%����%'
    order by dept_id;

-- 65) SG_Scores ���̺��� ����(score)�� 90������ 94������ ������ ���� ������������ ��ȸ , 
--       between~and �� ���
select *
    from sg_scores
    where score between 90 and 94
    order by score desc;
    
-- 66) SG_Scores ���̺��� ������ 60������ 100������ ������ ������ ���� ������������ ��ȸ, 
--       between~and �� ���
select *
    from sg_scores
    where score not between 60 and 100
    order by score desc;
    
-- 67) Course ���̺��� �߰������ᰡ null �� ���� ��ȸ�ؼ� ���������� �����Ͽ� ��ȸ
select *
    from course
    where course_fees is null
    order by title;
    
-- 68) Course ���̺��� �߰������ᰡ null �� �ƴ� ���� ��ȸ�ؼ� ���������� �����Ͽ� ��ȸ
select *
    from course
    where course_fees is not null
    order by title;
    
/*
 human �����ͺ��̽����� EC_Product, EC_Member, EC_Basket, EC_Order,  SG_Scores, Student 
 ���̺��� ��ȸ �� �ּ���
*/

-- 69) ��ǰ����(EC_Product) ���̺��� �ܰ��� 100������ �ʰ��ϴ� ��ǰ ����� ��ǰ�ڵ�, ��ǰ��, �ܰ� �� ��ȸ
select product_code , product_name , unit_price
    from ec_product
    where unit_price > 100
    order by unit_price;
    
-- 70) ȸ������(EC_Member) ���̺�κ��� ���￡�� �����ϴ� ȸ���� ����� 
--      ���̵�, ȸ����, �ֹε�Ϲ�ȣ, �ּҸ� ��ȸ
select userid, name, regist_no, address
    from ec_member
    where address like '����%';
    
-- 71) ��ٱ���(EC_Basket) ���̺��� 2018�� 7�� 11�Ͽ� �ֹ��� ����  �ֹ� ������ ��ȸ
select order_id , product_code
    from ec_basket
    where order_date = '2018-07-11';
    
-- 72) �ֹ�ó��(EC_Order) ���̺��� ������ ȸ�� �߿��� ��ǰ�� ������� ���� ȸ���� 
--      �ֹ���ȣ, ��ǰ�ڵ�, �ֹ�����, �������, �����ݾ�, ��������, ���� �� �ֹ���ȣ������ ��ȸ
select order_no , product_code , order_qty , csel, cmoney , cdate, gubun
    from ec_order
    where mdate is null
    order by order_id;
    
-- 73) ȸ������(EC_Member) ���̺��� ȸ���� '��' �� �� ȸ���� ȸ��ID, ȸ����, �ֹε�Ϲ�ȣ ��ȸ
select userid, name, regist_no
    from ec_member
    where name like '%��%';
    
-- 74) �ֹ�ó��(EC_Order) ���̺��� ����� �ֹ��� �߿��� '�ſ�ī��'�� �������� ���� �ֹ����� 
--      �ֹ���ȣ, �ֹ���ID, ��ǰ�ڵ�, �������, ������ �ֹ���ID �� �����ؼ� ��ȸ
select order_no , order_id , product_code , csel , gubun
    from ec_order
    where gubun = '���' and csel != '�ſ�ī��'
    order by order_id;
    
-- 75)��ǰ����(EC_Product) ���̺��� ��ǰ�� �ܰ��� 30�������� 50���� �̳��� ��ǰ ����� 
--    ��ǰ�ڵ�, ��ǰ��, �ܰ�, ������, ����ó �� �ܰ�(unit_price) ������������ ��ȸ
select product_code, product_name, unit_price, left_qty, company
    from ec_product
    where unit_price <= 500000 and unit_price >= 300000
    order by unit_price desc;
    
-- 76) �ֹ�ó��(EC_Order) ���̺��� '�ſ�ī��'�� ������ ���� 
--     �ֹ���ȣ, �ֹ���ID, �����ݾ�, ��������, ��������� ��ȸ
select order_no, order_id, cmoney, cdate, csel
    from ec_order
    where csel = '�ſ�ī��';

-- 77) �ֹ�ó��(EC_Order) ���̺��� �������� ���� ���� �ֹ���ȣ, �ֹ���ID, 
--     ��ǰ�ڵ�, �ֹ�����, ������ �ݾ�, ���� �� ��ȸ
select order_no, order_id, product_code, order_qty, cmoney, gubun
    from ec_order
    where gubun is null;
    
-- 78) �ֹ�ó��(EC_Order) ���̺��� 'usko' ȸ���� �ŷ��� ��ǰ�� 
--     �ֹ���ID, ��ǰ�ڵ�, �ֹ�����, �������, �����ݾ�, ������ ��ȸ
select order_id, product_code, order_qty, csel, cmoney, gubun
    from ec_order
    where order_id = 'usko';
    
-- 79) ��ǰ����(EC_Product) ���̺��� �Ｚ(samsung) ȸ���� ��ǰ�� 
--     ��ǰ�ڵ�, ��ǰ��, ����, �ܰ�, ������, ����ó �� ��ǰ������� ��ȸ
select product_code, product_name, unit, unit_price, left_qty, company
    from ec_product
    where company = 'SAMSUNG';
    
-- 80) ��ǰ����(EC_Product) ���̺��� '������' ��ǰ�� �ܰ�(Unit_Price) �� 
-- 50������ �ʰ��ϴ� ��ǰ�� ��ǰ�ڵ�, ��ǰ��, ����, �ܰ�, ������, ����ó �� �ܰ� ������������ ��ȸ
select product_code, product_name, unit, unit_price, left_qty, company
    from ec_product
    where product_name = '������' 
      and unit_price >= 500000;
      
-- 81) ȸ������(EC_Member) ���̺��� '��' �� ȸ���� ȸ����, �ֹ���Ϲ�ȣ, ��ȭ��ȣ, �������� �� ��ȸ
select name, regist_no, telephone, timestamp
    from ec_member
    where name like '��%';
    
-- 82) �ֹ�ó��(EC_Order) ���̺��� '�����Ա�' �� '������ü' �� 
--     ȸ���� �ֹ���ȣ, ��ǰ�ڵ�, �������, �������� �� �������, �������� ������ ��ȸ
select order_no, product_code, csel, cdate
    from ec_order
    where csel in ('�����Ա�','������ü')
    order by csel, cdate;
.
.
select order_no, product_code, csel, cmoney,cdate 
    from EC_Order 
    where csel in ('�����Ա�', '������ü') 
    order by csel, cdate; 

    
-- 83) ��ǰ����(EC_Product) ���̺��� 'HP' ȸ���� '������' ��ǰ�� ���� 
--     ��ǰ�ڵ�, ��ǰ��, ����, �ܰ�, �������� �ܰ������� ��ȸ
select product_code, product_name, unit, unit_price, left_qty
    from ec_product
    where company = 'HP' and
          product_name = '������';
          
-- 84) ��ǰ����(EC_Product) ���̺��� ����ó�� '�Ｚ(SAMSUNG)' �� 'LG����' �� �ƴ� 
--     ��ǰ�� ��ǰ�ڵ�, ��ǰ��, ����, �ܰ�, ������, ����ó�� ����ó, �ܰ� ������ ��ȸ
select product_code, product_name, unit, unit_price, left_qty, company
    from ec_product
    where company not in ('SAMSUNG', 'LG����')
    order by company, unit_price;
    
-- 85) ȸ������(EC_Member) ���̺��� �ּҰ� '����' �� '�뱸'�� �ƴ� 
--     ȸ���� ȸ����, �ֹε�Ϲ�ȣ, ��ȭ��ȣ, �ּҸ� �ּҼ����� ��ȸ
select name, regist_no, telephone, address
    from ec_member
    where address not in ( '����%' , '�뱸%' );
.
.
.
select name, regist_no, telephone, address 
    from EC_Member 
    where address not like '����%' and address not like '�뱸%' 
    order by address; 

-- 86) ��ǰ����(EC_Prodcut) ���̺��� �������� 10 �̸��� ��ǰ�� 
--     ��ǰ�ڵ�, ��ǰ��, �԰�, �ܰ�, ������, ����ó�� ��ǰ������� ��ȸ
select product_code, product_name, unit, unit_price, left_qty, company
    from ec_product
    where left_qty < 10;
    
-- 87) ȸ������(EC_Member) ���̺��� ��ȭ��ȭ�� '666' �� ���Ե� ȸ���� 
--     ȸ����, �ֹε�Ϲ�ȣ, ��ȭ��ȣ, �ּҸ� ȸ��������� ��ȸ
select name, regist_no, telephone, address
    from ec_member
    where telephone like '%666%'
    order by name;
    
-- 88) ȸ������(EC_Member) ���̺��� 2018�� 5�� 1�� ���Ŀ� ������ ȸ���� 
--     ȸ����, �ֹε�Ϲ�ȣ, ��ȭ��ȣ, �ּ�, �������ڸ� ȸ���������� ������ ��ȸ
select name, regist_no, telephone, address, timestamp
    from ec_member
    where timestamp > '2018-05-01'
    order by timestamp; 
    
-- 89) ��ǰ����(EC_Product) ���̺��� ��ǰ���� '��Ʈ'�� �����ϴ� ��ǰ�� 
--     ��ǰ�ڵ�, ��ǰ��, ����, �ܰ�, ������, ����ó�� ����ó������ ��ȸ
select product_code, product_name, unit, unit_price, left_qty, company
    from ec_product
    where product_name like '%��Ʈ%'
    order by company;
    
-- 90) ��ǰ����(EC_Product) ���̺��� 'LG' �� �����ϴ� ����ó�� ��ǰ�� 80������ 
--     �ʰ��ϴ� ��ǰ�ڵ�, ��ǰ��, ����, �ܰ�, ������, ����ó�� ��ǰ�ڵ������ ��ȸ
select product_code, product_name, unit, unit_price, left_qty, company
    from ec_product
    where company like '%LG%' and unit_price > 800000
    order by product_code;
    
-- 91) ��ǰ����(EC_Product) ���̺��� ����ó�� �Էµ��� ���� ���� 
--     ��ǰ�ڵ�, ��ǰ��, ����, �ܰ�, ������, ����ó�� ��ǰ�ڵ������ ��ȸ
select product_code, product_name, unit, unit_price, left_qty, company
    from ec_product
    where company is null
    order by product_code;
    
-- 92) �ֹ�ó��(EC_Order) ���̺��� ��ǰ�ڵ尡 'CM01'�̰� �ֹ��� 1�� �ʰ� �ֹ��� ���� 
--     �ֹ���ȣ, �ֹ���ID, ��ǰ�ڵ�, �ֹ�����, ���� �ݾ��� �ֹ���ID ������ ��ȸ
select order_no, order_id, product_code, order_qty, cmoney
    from ec_order
    where product_code = 'CM01' and order_qty > 1
    order by order_id;
    
-- 93) ȸ������(EC_Member) ���̺��� ȸ������ '��'�� ���� '��'���� ������ ȸ���� 
--     ȸ����, �ֹε�Ϲ�ȣ, ��ȭ��ȣ, �ּҸ� ȸ��������� ��ȸ
select name, regist_no, telephone, address
    from ec_member
    where name not between '��' and '��'
    order by name;
    
--select name, regist_no, telephone, address
--    from ec_member
--    where name > '��' and name > '��'
--    order by name; ??

-- 94) ����(SG_scores) ���̺��� ���������ڵ尡 'L1011'�� 'L1021' ������ ������ ��
--     ���� �л��� �����ڵ�, �й�, ����, ����������� �� �����ڵ�, �й������� ��ȸ
select course_id, student_id, score, score_assigned
    from sg_scores
    where course_id in ( 'L1011' , 'L1021' );
    
-- 95) ����(SG_Scores) ���̺��� ������ 80�� �̻��� �ƴ� ���� 
--     �����ڵ�, �й�, ����, ����������ڸ� ��ȸ
select course_id, student_id, score, score_assigned
    from sg_scores
    where not score >= 80;

-- 96) �л�(Student) ���̺��� �а��ڵ尡 '�İ�' �� '�濵' �а��� �ƴ� �л��� 
--     �а��ڵ�, �г�, �й�, ����, ��ȭ��ȣ�� �а��ڵ�, �й������� ��ȸ
select dept_id, year, name, telephone
    from student
    where dept_id not in ( '�İ�' , '�濵' )
    order by dept_id, year;
.
.

select dept_id, year, student_id, name, telephone 
    from student 
    where dept_id not in ('�İ�','�濵') 
    order by dept_id, student_id; 
-----------------------------------------------------------------------

-- 9�� 4�� ����
/*
human ������ ���̽��� �ش� �������� ������ �ּ���
emp, dept, dual ���̺��� ��ȸ�ϼ���
*/

-- 1) �� �μ� �̸��� ���̸� ����� �ּ���
select dname, length (dname) as "�μ��̸� ����"
    from dept;

-- 2) ��� �̸��� ���̰� 6�̻��� ����� ���� ��ȸ
select ename , length (ename)
    from emp
    where length (ename) >= 6;

-- 3) ����� �̸��� �ҹ��ڷ� ���
select ename , lower  (ename) as "�ҹ���"
    from emp;
    
-- 4) ������ ��¥�� ���
select sysdate as "���� ��¥" , (sysdate+1) as "���� ��¥"
    from dual;

--------------------------------------------------------------------
-- 5) ����� �ٹ� ���, ����, �ϼ��� ��ȸ
select
    ename as �̸�,
    trunc (sysdate - hiredate)as �ϼ�,
    trunc (months_between(sysdate, hiredate)) as ����,
    trunc (months_between(sysdate, hiredate)/12)as ���
    from emp
;
--------------------------------------------------------------------

-- 6) ������� �Ի��Ϸ� ���� 1�� 6������ ���� ���� ���
select hiredate, add_months(hiredate, 18) as "1�� 6���� ��"
    from emp;

-- 7) ���� �ð��� 'XXXX-XX-XX XX:XX:XX' ���ڿ��� ���
select sysdate ,
         to_char ( sysdate , 'YYYY-MM:DD HH24:MI:SS' ) as "���ڿ�"
    from dual;

-- 8) 20�� �μ��� Ŀ�̼��� ���� ����� ���� ���
select *
    from emp
    where  deptno = 20 and comm is not null;
    
-- 9) job �� CLERK �� ����� ��� �޿��� ��ȸ
select job, 
    avg ( sal ) as "��� �޿�"
    from emp
    where job = 'CLERK'
    group by job;
    
select avg ( sal )
    from emp
    where job = 'CLERK';

-- 10) ������� �޴� Ŀ�̼��� ����
select sum ( comm ) as "Ŀ�̼� ����"
    from emp
    where comm is not null;

-- 11) ������� �޴� �ִ� �ּ� �޿�
select
    max ( sal ) as "�ִ�޿�",
    min ( sal ) as "�ּұ޿�"
    from emp;
    
-- 12) �μ��� �޿� ���
select  job,
    trunc (avg ( sal )) as "�μ��� ��ձ޿�"
    from emp
    group by job;
    
-- 13) �޿��� Ŀ�̼��� �޴� ����� ���� ���
select 
    count(*) as "Ŀ�̼ǹ޴� ��� ��"
    from emp
    where comm is not null;
 
-- 14) �޿��� 2000�̻��� �μ��� ������� ���
select job,
    count(*) as "�����"
    from emp
    where sal >= 2000
    group by job
    order by job;
    
    
-- 15) �μ��� ��� �޿��� 1700�̻��� �μ���ȣ�� ��� �޿��� ��ȸ
select 
    empno,
    avg ( sal ) as "��ձ޿�"
    from emp
    group by empno
    having avg ( sal ) >= 1700
    order by empno;

-- 16) 1200 �̻��� �޿��� �޴� ������� �μ��� ��� �޿��� 1900�̻��� �μ���ȣ�� ��ձ޿��� ���
select 
    empno,
    avg ( sal ) as "��ձ޿�"
    from emp
    where sal >= 1200
    group by empno
    having avg ( sal ) >= 1900
    order by empno
    ;

-- 17) ��å�� PRESIDENT �� �ƴ� ����� ���� �μ��� �޿� ���� 6000�̻��� �μ��� �޿����� ��ȸ
select 
    job,
    sum ( sal ) as "�޿� ��"
    from emp
    where job != 'PRESIDENT'
    group by job
    having sum ( sal ) >= 6000;

-- 18) 20�� 30 �μ����� �ִ� �޿��� �޴� ����� �ִ� �޿��� ��ȸ
select 
    deptno,
    max ( sal )
    from emp
    where deptno in ( 20, 30 )
    group by deptno;
    
-- 19) 'HELLO' ���ڿ��� �ҹ��ڷ� ��ȯ�ϰ�, 'welcome' ���ڿ��� �빮�ڷ� ��ȯ
select 
    lower ( 'HELLO' ) as "�ҹ���",
    upper ( 'welcome' ) as "�빮��"
    from dual;

-- human �����ͺ��̽����� Department, Professor, Course , Student, SG_Scores ���̺��� ��ȸ �� �ּ���

-- 20) Course ���̺��� Title�� Title �÷��� ���ڿ� ���̿� ����Ʈ ������ ����Ͽ� ���ڿ� ���� ���� �������� 
--      ��ȸ�ϼ��� LENGTHB(str) : ���ڿ� ���̸� ����Ʈ ������ ���
select 
    title,
    length ( title ) as "title ���ڿ�����",
    lengthb ( title )
    from course
    order by length ( title ) desc;
    
-- 21) Professor ���̺��� �������� ������ ���� �����ϰ�, Email �ּҿ��� '@' ���ڰ� ��Ÿ���� ��ġ�� 
--      ������ ������ ���
select 
    substr ( name , 1 , 1 ),
    instr ( email , '@' )
    from professor
    order by substr ( name , 1 , 1 );
    
-- 22) 'xyxyxHello' ���ڿ����� 'x' �� 'y' ���ڸ� �����ϼ���
select 
    substr ( 'xyxyxHello' , 6 , 9 )
    from dual;
    
select 
    ltrim ('xyxyxHello',  'xyxyx' )
    from dual;

--      LTRIM (str, [������ ���� ����]) : ���ʺ��� ���������� ���� [������ ���� ����] �����ϸ� ������ ���ŵȴ�
--      RTRIM �� LTRIM ������ ����

-- 23) 'Oracle Serverkkkk' ���ڿ��� 'k' ���ڸ� �����Ͻÿ�
select 
    rtrim ('Oracle Serverkkkk' , 'kkkk')
    from dual;
    
-- 24) Professor ���̺��� ������, ����, ������� ������ �����Ͽ� ������ȣ������ ���
select 
    name ||' : '|| position || ', ' || duty as "Professor"
    from professor
    order by professor_id;

-- 25) ������ Email ������ �����θ��� 'cyber' ���� 'dream' ���� ����Ǿ��� . 
--      �̸� �����Ͽ� ����������� ���
--      Replace(str, ��������, [��ü���ڿ�]) : �������ڸ� ��ü���ڿ��� ��ȯ
select 
    name,
    replace ( email , 'cyber' , 'dream' ) as "email"
    from professor
    order by name;
       
-- 26) 12.345 ���� �Ҽ��� 2��° �ڸ����� ���
select 
    trunc ( 12.345 , 2 )
    from dual;
    
-- 27) 100�� 3���� ������ ��� �������� ����Ͽ� ���
select 
    floor (100 / 3 ) as "��",
    mod ( 100 , 3 ) as "������"
    from dual;

-- 28) ���� ��¥�� ���
select sysdate as "���� ��¥"
    from dual;
    
-- 29) ���� ��¥�� 10������ ���Ͽ� ��ȸ
select 
    sysdate,
    add_months ( sysdate , +10 )
    from dual;
    
-- 30) Student ���̺��� '�İ�'�а� �л��鿡 ���� ���������� ����Ͽ� ���. �������� CURRENT_DATE ��
select 
    sysdate as "����",
    i_date "����",
    trunc ( months_between ( current_date, i_date ) ) as "��������"
    from student
    where dept_id = '�İ�';

select *
    from student;
    
---------------------------------------------------------------------------------------

-- 31) Student ���̺��� �ֹε�Ϲ�ȣ�� �̿��Ͽ� ��������� �����ϰ� ��¥�� �����ͷ� 
--      'RRMMDD', 'YYMMDD' �� ���� ��ȯ�Ͽ� 'YYYY/MM/DD' �������� ���
select
    to_char ( ( substr ( id_number , 1 , 6 ) ) , 'yymmdd' )
from student
;

select student_id, name, id_number,
       to_date(substr(id_number, 1, 6), 'RRMMDD') "RR/MM/DD",
       to_date(substr(id_number, 1, 6), 'YYMMDD') "YY/MM/DD"
  from student
;

select 
    student_id, 
    name, id_number, 
    to_date(substr(id_number, 1,6), 'RRMMDD') as r1, 
    to_date(substr(id_number, 1,6), 'YYMMDD') as y1 
    from student; 


---------------------------------------------------------------------------------------

-- 32) ���� ��¥�� �ð��� 'YYYY-MM-DD HH24:MI:SS FF3' �������� ��ȯ�Ͽ� ���
select 
    to_char ( systimestamp , 'YYYY-MM-DD HH24:MI:SS FF3')
    from dual;
    
select 
    to_char ( sysdate , 'YYYY-MM-DD HH24:MI:SS' )
    from dual;

-- 33) Student ���̺��� ���г�¥(I_Date) �÷��� �����Ͽ� 'RRRR/MM/DD (DAY)' �������� 
--       ��ȯ�Ͽ�  �������ڼ����� ���
select 
    name,
    to_char ( i_date , 'RRRR/MM/DD' ) as "���г�¥"
    from student 
    order by i_date
;

-- 34) SG_Scores ���̺��� ����(Score) �� 98�� �̻��ڿ� ���Ͽ� ���� ������ڸ� 
--      'YYYY/MM/DD' ������ ���������� ��ȯ�Ͽ� ���
select 
    score,
    to_char ( score_assigned , 'YYYY/MM/DD' ) as "��ȯ"
    from sg_scores
    where score >= 98
;

-- 35) SG_Scores ���̺�κ��� ������ 98�� �̻��� ������ ���������� ��ȯ�Ͽ� ���
select 
    to_char ( score )
    from sg_scores
    where score >= 98
;
    
select *
    from sg_scores;
    
-- 36) SG_Scores ���̺��� ������ 98�� �̻��� �࿡ ���Ͽ� ������
--      'S999', 'B999', '0.99.99' �������� ��ȯ�Ͽ� ���
select 
    to_char ( score , 'S999' ) as "S999",
    to_char ( score , 'B999' ) as "B999",
    to_char ( score , '999.99' ) as "0.99.99"
    from sg_scores
    where score >= 98
;

-- 37) Course ���̺��� �߰� �����ᰡ 4���� ���� ���Ͽ� ���ڿ��� ��ȯ�Ͽ� 
--      '999,999', 'L999,999', 'C999G999' �������� ���
select 
    to_char ( course_fees , '999,999' ) as "999,999",
    to_char ( course_fees , 'L999,999' )as "L999,999",
    to_char ( course_fees , 'C999G999' )as "C999G999"
    from course
    where course_fees = 40000
;

-- 38) Course ���̺��� �߰� �����ᰡ 4���� (4 * 10**4) �� ���� ���Ͽ� ���ڿ��� ��ȯ�Ͽ� 
--     '9.99EEEE' ������������ ��ȯ�Ͽ� ���
select 
    to_char ( course_fees , '9.99EEEE' ) as "9.99EEEE"
    from course
    where course_fees = 40000
;
.
.

select 
    course_fees, 
    to_char(course_fees, '9.99EEEE') 
    from Course 
    where course_fees = 40000
    ; 


-- 39) '$123.45' ���ڿ��� ���������� ��ȯ
select 
    to_number ( '$123.45', '$999,999.99')
    from dual
;

-- 40)Course ���̺��� Course_Fees �� null �� �� 0 ���� ��ȯ�Ͽ� ���
select 
    course_fees , nvl ( course_fees , 0 ) as "course_fees1"
    from course
;

-- 41) Course ���̺��� �߰�������(Course_fees) �� null �� �ƴ� ���� 
--     �߿��� 4���� �̸��� ���� ��ȸ
select *
    from course
    where course_fees is not null and course_fees < 40000
;

-- 42) Course ���̺��� �߰������Ḧ 5% �λ� �ݾ��� ���
select 
    course_fees ,
    course_fees * 1.05
    from course 
;

select 
    course_id, course_fees, 
    nvl2(course_fees, course_fees*1.05, 0) 
    from Course; 


-- 43) '��ǻ�Ͱ��а�' �л��� �ֹε�Ϲ�ȣ�� �̿��Ͽ�, 
--     �����ڵ尡 '1'�� '3' �� �� '��', '2'�� '4' �� �� '��'�� ��ȭ�Ͽ� ���, decode �� ���
select 
    id_number as "�ֹι�ȣ",
    decode 
    (substr(id_number , 8 ,1), 
    '1' , '����' , '3' , '����',
    '2' , '����' , '4' , '����') as "�ֹι�ȣ ����" 
    from student
    where dept_id = '�İ�'
;


-- 44)'C1601' �й��� ���Ͽ� SG_Scores ���̺��� ������ 
--    'A'(90~100), 'B'(80~89), 'C'(70~79), 'D'(60~69), 'F'(0~59) 
--    ������� ��ȯ�Ͽ� �����ڵ������ ���, case when ���
select 
    student_id, course_id, score,
    case when score >= '90' then 'A'
         when score >= '80' then 'B'
         when score >= '70' then 'C'
         when score >= '60' then 'D'
         else 'F'
    end "���"
    from sg_scores
    where student_id = 'C1601'
    order by "���"


-- 45)Professor ���̺��� ������ 
--    '����', '����', '�α���', '������', '�ʺ�����' �� ������, �а��ڵ������ ���
select *
    from professor
    order by decode
    ( position, '����' , 1,
                '����' , 2,
                '�α���', 3,
                '������', 4,
                '�ʺ�����', 5), professor_id
;

/*
human �����ͺ��̽����� 
EC_Product, EC_Member, EC_Basket, EC_Order,  T_SG_Scores ���̺��� ��ȸ �� �ּ���
*/

-- 46) ȸ������(EC_Member) ���̺��� '����' �����ڿ� ���Ͽ� ȸ������ 
--     ������ �����Ͽ� ȸ����, ��, ��ȭ��ȣ, �ּҸ� ���
select 
    name,
    substr ( name, 1, 1),
    telephone,
    address
    from ec_member
    where address like '����%'
;

-- 47) ��ǰ����(EC_Product) ���̺��� ��� ��ǻ�� ��ǰ�� ��� ������ ������ �����Ͽ� 
--     ��ǰ�ڵ�, ��ǰ��, ����, ������, ����ó�� ���, concat ���
select
    product_code,
    product_name,
    concat (left_qty, unit),
    company
    from ec_product
;

-- 48) �ֹ�ó��(EC_Order) ���̺��� �����ݾ��� 100���� �̻� ������ �ֹ����� 
--     ��������(CDate) �� ���('YYYY/MM') �������� ��ȯ�Ͽ� ���
select 
    to_char ( cdate , 'YYYY/MM' )
    from ec_order
    where cdate is not null and cmoney >= 1000000
    order by cdate;
;
    
-- 49) ȸ������(EC_Member) ���̺��� �������� �������� ȸ�����ԱⰣ�� 
--     'xx�� xx��' �� ����Ͽ� 1�� �̻��� ȸ���� ���
select
    Current_DATE as "��������",
    trunc(months_between(Current_DATE, Timestamp) /12)||'��'||
    mod(trunc(months_between(Current_DATE, Timestamp)),12) ||'��' as "���ԱⰣ"
    from ec_member
    where trunc(months_between(Current_DATE, Timestamp)/12) >= 1
    order by name
;

-- 50) ��ǰ����(EC_Product) ���̺��� ��ǰ���� '���ο���ǻ��','��Ʈ����ǻ��',
--     '������','TV', ��Ÿ ��¼��� 1������, �ܰ� �������� 2������ �����ؼ� ���
select *
    from ec_product
    order by decode
    ( product_name, 
    '���ο���ǻ��' , 1,          
    '��Ʈ����ǻ��' , 2,
    '������', 3,
    'TV', 4,
    '��Ÿ', 5), unit_price desc
;

/*
human �����ͺ��̽����� 
Department, Professor, Course , Student, SG_Scores ���̺��� ��ȸ �� �ּ���
*/

-- 51) Student ���̺��� ���� ���� Email �� ����� ���� ���� ��ȸ
--     count(*) : ���̺��� ��� ���� ���� ��ȸ
select 
    count(*),
    count(DISTINCT email)
    from student
;

-- 52) SG_Scores ���̺��� 'C1701' �й��� ��������� ��ȸ
select
    count(*) as "�������"
    from sg_scores
    where student_id = 'C1701'
;

-- 53)SG_Scores ���̺��� �����ڵ� 'L1031', 'SQL����' �� �ְ� ������ ���� ������ ��ȸ
-- SG_Scores ���̺��� �����ڵ尡 'L1031','SQL����' ������� ������ ���� ������ ����� ��ȸ

select
    sum ( score ) as "����",
    avg ( score ) as "���"
    from sg_scores
    where course_id = 'L1031' and course_id ='SQL����'
;

-- 54) SG_Scores ���̺��� �����ڵ尡 'L1031','SQL����' ������� ������ 
--     ���� ǥ������, �л��� ��ȸ
select
    stddev ( score ) as "ǥ������",
    variance ( score ) as "�л�"
    from sg_scores
    where course_id = 'L1031' and course_id ='SQL����'
;
    
-- 55) Professor ���̺��� �̿��Ͽ� �а��� ���� �ο����� ��ȸ
select 
    dept_id,
    count(*) as "�а��� �����ο���"
    from professor
    group by dept_id
;
-- 56) Professor ���̺��� �̿��Ͽ� �а��� ���� �ο����� 1���� �а��� ��ȸ
select 
    dept_id,
    from professor
    where position = '����'
    group by dept_id;

--------------------------------------------------------------------------------

-- 57) SG_Scores ���̺��� �й����� 8���� �̻��� ����� �й��� ������� ����� �й������� ��ȸ
select 
    student_id, 
    count(1) "�������",
    to_char(avg(score),'99.99') "���"
    from sg_scores
    group by student_id
    having count(1) >= 8
    order by 1
;
------------------------------------------------------------------------------------------

-- 58) Student ���̺�κ��� �а���/�г⺰ �ο����� ����Ͽ� �а���/�г⺰�� ��ȸ
select 
    dept_id, 
    year, 
    count(*) "�ο���"
    from student
    group by dept_id, year
    order by dept_id, year
;
------------------------------------------------------------------------------------------

-- 59) �ֹ�ó��(EC_Order) ���̺��� ������ ����������� �������, �ֹ��Ǽ�, 
--     �ֹ����� �հ�,  �����ݾ� �հ� �� ����Ͽ� ������������� ���
select 
    to_char(cdate, 'YYYY/MM'), 
    count(cdate) as "�ֹ��Ǽ�",
    sum(order_qty) as "�ֹ����� �հ�", 
    sum(cmoney) as "�����հ�"
    
    from ec_order 
    where cdate is not null 
    group by to_char(cdate, 'YYYY/MM')
    order by to_char(cdate, 'YYYY/MM') ; 

--------------------------------------------------------------------------------

-- 60) ȸ������(EC_Member) ���̺��� ��,�� ȸ������ ��ȸ, ��, �����ڵ尡 
--     1�Ǵ� 3�̸� ����, 2 �Ǵ� 4�̸� ����
select
    count 
    (decode
    (substr(regist_no , 8 ,1), 
    '1' , '����', '3' , '����')) as "���� ȸ����",
    count 
    (decode
    (substr(regist_no , 8 ,1),
    '2' , '����' , '4' , '����' ))as "���� ȸ����"
    from ec_member;
.
.
select
    decode(substr(regist_no , 8 ,1), 
    '1' , '����', '2' , '����' , '3' , '����' , '4' , '����') as "����",
    count (*) as "ȸ����"
    from ec_member
    group by decode(substr(regist_no , 8 ,1), 
    '1' , '����', '2' , '����' , '3' , '����' , '4' , '����');

--------------------------------------------------------------------------------

-- 61) �ֹ�ó��(EC_Order) ���̺��� ����� �����ݾ��� ���� ���� �ݾ��� ��������������� ���

select 
    to_char (cdate, 'YYYY/MM') "�������",
    max(cmoney) "�����ִ�ݾ�"
    from  ec_order 
    where cdate is not null 
    group by to_char(cdate, 'YYYY/MM') 
    order by to_char(cdate, 'YYYY/MM') ; 


--------------------------------------------------------------------------------


-- 24.09.05 ����

/*
human ������ ���̽��� �ش� �������� ������ �ּ���
emp, dept, salgrade ���̺��� ��ȸ�ϼ���
join �� �ʿ��� �������� join ���� �������� �ۼ��ϼ��� 
*/


-- 1. ������� �̸��� ����� ��ȸ
select 
    ename, empno
    from emp;



-- 2. job �� CLERK �� ������� �̸��� �μ����� ��ȸ
select 
    e.job, e.ename, d.dname
    from emp e , dept d
    where e.deptno = d.deptno 
    and e.job = 'CLERK'
    order by e.ename
;



-- 3. �޿��� 2600 �̻��� ����� �̸��� �μ����� ��ȸ
select 
    e.ename, d.dname , e.sal
    from emp e , dept d
    where e.deptno = d.deptno 
    and e.sal >= '2600'
    order by e.sal
;


-- 4. ����� �޿��� ����� �޿��� ��ȸ - self join ��� , self join : ���� ���̺��� ����
select 
    e1.empno as ������ȣ,
    e1.sal as ����_�޿�,
    e1.mgr as �Ŵ���_������ȣ,
    e2.sal as �Ŵ���_�޿�
    
    from emp e1, emp e2
    where e1.mgr=e2.empno
;



-- 5. �����ȣ�� �������� �����ȣ�� ���. ��, �����ڰ� ��� ���
select 
    empno as �����ȣ,
    mgr as ������_�����ȣ
    from emp
;



-- 6. ��� �̸��� ����� �ٴϴ� �μ����� ��ȸ. ��, ����� �������� �ʴ� �μ��� �μ��� ���
select
    d.dname as �μ���, 
    e.ename as ����̸�
    from dept d left join emp e on e.deptno = d.deptno 
    order by dname
;



-- 7. �μ���ȣ�� 20�� ����� ���, �μ���ȣ, �μ���ġ�� ���
select
    e.ename as �̸� , 
    e.empno as ��� , 
    d.deptno as �μ���ȣ , 
    d.loc as �μ���ġ
    from dept d join emp e on d.deptno = e.deptno and e.deptno = 20
    order by e.empno
;
    
    
    
-- 8~14���� ���� ������ ����ؼ� ������ �ۼ��ϼ���
-- 8. JAMES ����� �μ��̸��� ��ȸ
select
    ename as ����̸�,
    ( select dept.dname
        from dept
        where dept.deptno = emp.deptno ) as �μ��̸�
    from emp 
    where ename = 'JAMES' 
;



-- 9. ��� �޿����� ���� �޴� ����� �̸��� �޿��� �̸��� �޿� ������ ������������ ����
select 
    ename as ����̸�,
    sal as �޿�,
    
    ( select 
    trunc (avg ( sal )) 
    from emp ) as ��ձ޿�
    
    from emp
    where sal  > ( select avg ( sal ) from emp ) 
    order by sal desc
;



-- 10. 10�� �μ��� �ִ� �޿��� ���� �޿��� �޴� �����ȣ�� �̸� ��ȸ
select 
    empno as �����ȣ ,
    ename as ����̸� ,
    sal as �޿�
    from emp
    where deptno != '10' and sal = 
    (select 
     max (sal) as "10���μ� �ִ�޿�"
    from emp
    where deptno = 10 )
    
;



-- 11. 20�� �μ��� �ִ� �޿����� ���� �޴� ��� ��ȣ�� �̸� ��ȸ
select
    empno as �����ȣ ,
    ename as ����̸�,
    sal as �޿�
    from emp
    where deptno != '20' and sal >
    ( select
        max ( sal ) as "20���μ� �ִ�޿�"
        from emp
        where deptno = '20' )
;



-- 12. BLAKE �� ���� �� ��������� ��ȸ
select *
    from emp
    where mgr in
    ( select empno
        from emp
        where ename = 'BLAKE');        
        
select *
    from emp e1 join emp e2 on e1.mgr=e2.empno 
    where e2.ename = 'BLAKE'
;


----------------------------------------------------------XXXXX

-- 13. ���� ������ �ִ� ��� ������ ��ȸ
select * 
    from employees
    where employee_id in 
    (select employee_id from employees where manager_id is not null);

select *
    from employees;

---------------------------------------------------------------

-- 14. ���� ������ ���� ��� ������ ��ȸ
select * 
    from employees
    where employee_id in 
    (select employee_id from employees where manager_id is null);


---------------------------------------------------------------


/*
human �����ͺ��̽����� Department, Professor, Course ,  T_Course, Student, 
SG_Scores ���̺��� 
��ȸ �� �ּ���
*/



-- 15. ���ο� ���� ������ T_Course ���̺� �����Ͻÿ�. 
--     �����ڵ�� 'L1061', ������� 'ERP�ǹ�', 
--     3�����̸�, ��米���� 'P12' �̰� �߰� ������� 50000�� �̴�
insert into 
T_Course ( course_id , title, c_number, professor_id, course_fees )
values 
( 'L1061', 'ERP�ǹ�' , 3 , 'P12' , 50000 )
;
.
.
select *
    from t_course;



-- 16. ���ο� ���� ������ T_Course ���̺� �����Ͻÿ�. 
--     �����ڵ�� 'L1062', ������� '�׷�����', 3�����̸�, ��米���� 'P13' �̰� 
--     �߰� ������� 40000�� �̴�
insert into T_Course 
( course_id, title, c_number, professor_id, course_fees )
values
( 'L1062' , '�׷�����' , 3 , 'P13' , 40000 );
.
.
select *
    from t_course;
    
    
    

-- 17. �й��� 'B1701', �����ڵ尡 'L1051', ������ 85��, ������泯¥�� 2018�� 6�� 28�� �̴�. 
--       SG_Scores ���̺� �����ϼ���
insert into sg_scores
( student_id, course_id, score, grade, score_assigned )
values
( 'B1701', 'L1051', 85, null , '2018-06-28' );
.
.
select *
    from sg_scores;




-- 18. �����ڵ� 'L3041', ������� 'JQUERY', 3����, ������ȣ�� 'P31' , 
--     �߰� �����ᰡ 30000���̴� Course ���̺� �����ϼ���
select *
    from Course;

-- mgr ������Ÿ�� ����
alter table professor modify mgr varchar2(10);

-- 'P31' ���� ����
insert into professor
( professor_id, name, position, dept_id, telephone, email, duty, mgr )
values
( 'P31' , '������' , '����' , '�İ�' , '123-123', 'jung', '����', 'null' );

-- ���� Ŭ����
insert into course
( course_id , title , c_number , professor_id , course_fees )
values
( 'L3041' , 'JQUERY' , 3 , 'P31' , 30000 );




-- 19. �����ڵ尡 'L1031', ������� 'SQL' , 3����, ��米���� 'P12', 
--     �߰� ������� 30000���̴�. Course ���̺� �����ϼ���
select *
    from course;
    
insert into course
( course_id , title , c_number , professor_id , course_fees )
values
( 'L1031' , 'SQL' , 3 , 'P12' , 30000 );




-- 20. ������� '��������',3����, ��米���� 'P22', �߰� ������� 30000���̴�. 
--     Course ���̺� �����ϼ���
select *
    from course;
    
insert into course
( course_id , title , c_number , professor_id , course_fees )
values
( 'null' , '��������' , 3 , 'P22' , 30000 );
-- course_id �� null�� �ϴϱ� ���׿� 





-- 21. ��ǻ�Ͱ��а��� ���� ������ȣ�� 'P14', �������� ������, ������ ������, 
--     ��ȭ��ȣ�� 765-4114 �̴�. Professor ���̺� �����ϼ���.
select * 
    from professor;
    
insert into professor
( professor_id , name, position, dept_id, telephone, email, duty, mgr )
values
( 'P14' , '������' , '������' , '�İ�' , '765-4114' , null , null , null );





-- 22. '�İ�' �а� 2�г⿡ ������ �л��� �����Ͽ���. �й��� C1731 , 
--      �ֹε�Ϲ�ȣ�� 011109-4*****, �̸����ּҴ� c1731@cyber.ac.kr �̴�.
--      Student ���̺� �����ϼ���
select *
    from student;
    
insert into student
( dept_id , year , student_id , name, id_number, address, telephone, email, status, i_date )
values
( '�İ�' , 2 , 'C1731' , '������' , '011109-4*****' , null , null , 'c1731@cyber.ac.kr', null, null );





-- 23. 'C1731'  �� ������ �л��� �ֹε�Ϲ�ȣ�� �߸� ��ϵǾ���. ��
--       �ε�Ϲ�ȣ�� '011119-4****** �� �����Ͽ� �����ϼ���
select *
    from student;

update student set id_number = '011119-4******' where student_id = 'C1731';




--------------------------------------------------------------------------------




-- 24. ��ǻ�Ͱ��а��� �ð����縦 �����Ͽ���. ������ȣ�� 'P91', �������� 'Bob Miner' , 
--     ������ '�ð�����' , ��ȭ��ȣ�� '765-4119' �̴�. Professor ���̺� ����
select *
    from professor;

insert into professor
( professor_id , name, position, dept_id, telephone, email, duty, mgr )
values
( 'P91' , 'Bob' , '������' , '�İ�' , '765-4119' , null , null , null );

-- üũ ��������(C##HUMAN.PROFESSOR_CK)�� ����Ǿ����ϴ�
-- ��� ��ϴ� !!

-- position �� '����', '�ð�����' �� �ȵ��� '������' �� �ϴϱ� ���Եƽ��ϴ�


--------------------------------------------------------------------------------



-- 25. �й��� 'C1731', �����ڵ尡 'L1021', ������ 97��, ������泯¥�� 2018�� 6�� 28�� �̴�. 
--       SG_Scores ���̺� �����ϰ� ����� �ּ���
select *
    from SG_Scores;
    
insert into SG_Scores
( student_id, course_id, score, grade, score_assigned )
values
( 'C1731', 'L1021', 97, null, '16/06/28' );




-- 26. Department ���̺��� �а����� ���� '��ǻ�������迭' �� �����ϼ���
select *
    from Department;
    
alter table Department rename column dept_name to ��ǻ�������迭;




-- 27. Course ���̺��� ����� 'Delphi' �� '������' �� ������ �ּ���
select *
    from course;

update course set title = '������' where course_id = 'L1042';





-- 28. �й��� 'C1601', �����ڵ尡 'L1021' �� ������ 85���� 105������ �߸� �Է��Ͽ���. 
--       SG_Scores ���̺��� ������ �����ϼ���
select *
    from SG_Scores;
    
update SG_Scores set score = '85' where course_id = 'L1021' and student_id = 'C1601';





-- 29. SG_Scores ���̺��� 'L2061' ������ ������û�ڸ� �˻��Ͽ� Ȯ���ϰ�, 
--      �Ʒ� ǥ�� �����Ͽ� ������ �Է��ϼ���
select *
    from SG_Scores;


-- �� �߰� 
alter table SG_Scores add name varchar(20);
alter table SG_Scores add ����� varchar(10);


-- �÷� �����
alter table SG_Scores modify score invisible;
alter table SG_Scores modify grade invisible;
alter table SG_Scores modify score_assigned invisible;


-- �÷� ���̱�
alter table SG_Scores modify score visible;
alter table SG_Scores modify grade visible;
alter table SG_Scores modify score_assigned visible;


-- �ܷ�Ű ����� �θ����̺� �� �Է� 
-- ������Ÿ�� ����
alter table course modify title varchar2(40);

-- �Է°�
insert into course
( course_id, title, c_number, professor_id, course_fees )
values
( 'L2061' , '�����������ӿ�ũ' , '3', null, null);



-- Ÿ�Ժ���
alter table SG_Scores modify ����� varchar2(30);


insert into  SG_Scores
( student_id, course_id, name, �����, score, grade, score_assigned )
values
( 'C1701', 'L2061', null, '�����������ӿ�ũ', 87, null, '18/12/26');

insert into  SG_Scores
( student_id, course_id, name, �����, score, grade, score_assigned )
values
( 'C1702', 'L2061', null, '�����������ӿ�ũ', 87, null, '18/12/26');
    
insert into  SG_Scores
( student_id, course_id, name, �����, score, grade, score_assigned )
values
( 'C1601', 'L2061', null, '�����������ӿ�ũ', 99, null, '18/12/26');

insert into  SG_Scores
( student_id, course_id, name, �����, score, grade, score_assigned )
values
( 'C1602', 'L2061', null, '�����������ӿ�ũ', 93, null, '18/12/26');






-- 30. Course ���̺��� �����ڵ� 'L0012' �̰� ������� '���а� ����' �� ������ �����Ͻÿ�
select *
    from Course;
-- L0012, ���а� ����, 2, null , null
delete from Course where course_id = 'L0012' and title = '���а� ����';





-- 31. ���� ������ T_Course ���̺� �����ϰ� ��ȸ�ϼ���
select *
    from t_course;

-- ������ ũ�� ����
alter table t_course modify title varchar2(25); //varchar2

-- �� �߰�
insert into t_course
( course_id, title, c_number, professor_id, course_fees )
values
( 'L3001', '������ ������Ʈ', 3, 'P11' , 50000);

insert into t_course
( course_id, title, c_number, professor_id, course_fees )
values
( 'L3002', '��������α׷���', 3, 'P12' , null);

insert into t_course
( course_id, title, c_number, professor_id, course_fees )
values
( 'L3003', '�����ͺ��̽�Ʃ��', 2, 'P13' , 50000);

insert into t_course
( course_id, title, c_number, professor_id, course_fees )
values
( 'L3004', '������ ����', 2, 'P14' , 30000);





-- 32. T_SG_Scores ���̺� ������ ��ȸ
select *
    from T_SG_Scores;
    
-- �� �߰� 
alter table T_SG_Scores add ����� varchar(30);
alter table T_SG_Scores add name varchar(20);

-- �÷� �����
alter table T_SG_Scores modify student_id invisible;
alter table T_SG_Scores modify course_id invisible;
alter table T_SG_Scores modify ����� invisible;
alter table T_SG_Scores modify score invisible;
alter table T_SG_Scores modify grade invisible;
alter table T_SG_Scores modify score_assigned invisible;

-- �÷� ���̱�
alter table T_SG_Scores modify student_id visible;
alter table T_SG_Scores modify course_id visible;
alter table T_SG_Scores modify ����� visible;
alter table T_SG_Scores modify score visible;
alter table T_SG_Scores modify grade visible;
alter table T_SG_Scores modify score_assigned visible;


-- �Է°� ����
insert into T_SG_Scores
( student_id, course_id, �����, score, grade, score_assigned )
values
( 'C1801', 'L3001', '������ ������Ʈ', NULL, 3, '2018/02/23');

insert into T_SG_Scores
( student_id, course_id, �����, score, grade, score_assigned )
values
( 'C1801', 'L3002', '��������α׷���', NULL, 3, '2018/02/23');

insert into T_SG_Scores
( student_id, course_id, �����, score, grade, score_assigned )
values
( 'C1801', 'L3003', '�����ͺ��̽�Ʃ��', NULL, 2, '2018/02/23');

insert into T_SG_Scores
( student_id, course_id, �����, score, grade, score_assigned )
values
( 'C1801', 'L4001', '������ ����', NULL, 2, '2018/02/23');


insert into T_SG_Scores
( student_id, course_id, �����, score, grade, score_assigned, name)
values
( 'C1802', 'L3001', '������ ������Ʈ', NULL, 3, '2018/02/24', '������');

insert into T_SG_Scores
( student_id, course_id, �����, score, grade, score_assigned, name)
values
( 'C1802', 'L3002', '��������α׷���', NULL, 3, '2018/02/24', '������');

insert into T_SG_Scores
( student_id, course_id, �����, score, grade, score_assigned, name )
values
( 'C1802', 'L3003', '�����ͺ��̽�Ʃ��', NULL, 2, '2018/02/24', '������');

insert into T_SG_Scores
( student_id, course_id, �����, score, grade, score_assigned, name )
values
( 'C1802', 'L1051', '������ ����', NULL, 2, '2018/02/24', '������');





-- 33. T_SG_Scores ���̺��� 'C1802' �й��� ������ �л��� ������û�� L1051 ������ L3004  
--      ������ ���� ���� �������� ������ �ּ���
select *
    from T_SG_Scores;

update T_SG_Scores set course_id = 'L3004' where student_id = 'C1802' and ����� = '������ ����';
update T_SG_Scores set ����� = '������ ����' where student_id = 'C1802' and course_id = 'L3004';




-- 34. T_SG_Scores ���̺� ���� ������ �����ϰ� ��ȸ
select *
    from T_SG_Scores;
    
-- ������ȣ ����
alter table T_SG_Scores add ������ȣ varchar(20);

-- �� �Է� ( ������ȣ P11 )
insert into T_SG_Scores
( student_id, course_id, �����, score, grade, score_assigned, name, ������ȣ )
values
( 'C1001', 'L3001', '������������Ʈ', '98', NULL, '2018/06/28', NULL, 'P11');

insert into T_SG_Scores
( student_id, course_id, �����, score, grade, score_assigned, name, ������ȣ )
values
( 'C1002', 'L3001', '������������Ʈ', '88', NULL, '2018/06/28', NULL, 'P11');

-- �� �Է� ( ������ȣ P12 )
insert into T_SG_Scores
( student_id, course_id, �����, score, grade, score_assigned, name, ������ȣ )
values
( 'C1001', 'L3002', '��������α׷���', '97', NULL, '2018/06/28', NULL, 'P12');

insert into T_SG_Scores
( student_id, course_id, �����, score, grade, score_assigned, name, ������ȣ )
values
( 'C1001', 'L3002', '��������α׷���', '92', NULL, '2018/06/28', NULL, 'P12');


-- �� �Է� ( ������ȣ P13 )
insert into T_SG_Scores
( student_id, course_id, �����, score, grade, score_assigned, name, ������ȣ )
values
( 'C1001', 'L3003', '�����ͺ��̽�Ʃ��', '92', NULL, '2018/06/28', NULL, 'P13');

insert into T_SG_Scores
( student_id, course_id, �����, score, grade, score_assigned, name, ������ȣ )
values
( 'C1002', 'L3003', '�����ͺ��̽�Ʃ��', '93', NULL, '2018/06/28', NULL, 'P13');


-- �� �Է� ( ������ȣ P14 )
insert into T_SG_Scores
( student_id, course_id, �����, score, grade, score_assigned, name, ������ȣ )
values
( 'C1001', 'L3004', '������ ����', '89', NULL, '2018/06/28', NULL, 'P14');

insert into T_SG_Scores
( student_id, course_id, �����, score, grade, score_assigned, name, ������ȣ )
values
( 'C1002', 'L3004', '������ ����', '97', NULL, '2018/06/28', NULL, 'P14');





-- 35. �����ڵ� 'L2033' �� '�������α׷���' ���������� �󰭵Ǿ���. 
--       T_Course ���̺��� 'L2033' �����ڵ带 �����Ͻÿ�
select *
    from T_Course;

delete from T_Course where course_id = 'L2033' and title = '�������α׷���';


-- 36. T_Course ���̺��� �����ڵ尡 'L1031' ������� 'SQL' �� �߰������Ḧ 30000������ �����Ͻÿ�
select *
    from T_Course;
update T_Course set course_fees = '30000' where course_id = 'L1031' and title = 'SQL����';





-- 37. T_Course ���̺��� �����ڵ尡 'L4' �� �����ϴ� �����ڵ���� �����ϼ���
select *
    from T_Course;
delete from T_Course where course_id like 'L4%';





-- 38. Professor ���̺�� Course ���̺��� �̿��Ͽ� ������ �ּ��� ���� �̻��� ����ϰ� �ִ� 
--      ������ ������ȣ, ������, ����, �����, �������� ������ȣ������ ���
select *
    from Professor;
select *
    from Course;
    
select
    p.professor_id,
    p. name,
    p.position,
    c.title,
    c_number
    from Professor p left join Course c on p.professor_id = c.professor_id
    where c.professor_id is not null and c.C_number is not null
    order by p.professor_id;
  
    
    
    
    
-- 39. SG_Scores, Student , Course ���̺��� �̿��Ͽ� 'C1701' �й��� 
--     �г�, ����� ������ ����� ������ �����ڵ�, �����, ������, ����, ����� ����ϼ���

select
    s.student_id,
    c.course_id,
    c.title,
    c.c_number,
    g.score,
    g.grade
    from Student s join SG_Scores g on s.student_id = g.student_id 
        join Course c on g.course_id = c.course_id
    where s.student_id = 'C1701'; 

select *
    from SG_Scores;
select *
    from Student;
select *
    from Course;




-- 40. Professor ���̺��� ��� ������ ���� ������ȣ, ������, ������ ����ϵ�, Course ���̺��� �����Ͽ� 
--      ������ �����ϰ� �ִ� ���� ���Ͽ� �����, �������� ���
select *
    from Professor;
    
    select *
    from Course;
    
select
    p.professor_id,
    p.name,
    p.position,
    c.title,
    c.c_number
    from Professor p left join Course c on p.professor_id = c.professor_id
    where c.title is not null and c.c_number is not null;





-- 41. Course ���̺��� ��� �������� ���Ͽ� �����, �������� ����ϵ�, Professor ���̺��� �����Ͽ� 
--      ����ϰ� �ִ� ������ ������ȣ, ������, ������ ���
select *
    from Professor;

select *
    from Course;

select 
    c.title,
    c.c_number,
    p. professor_id,
    p. name,
    p. position
    from Course c left join Professor p on c.professor_id = p.professor_id
    where c.professor_id is not null;




-- 42. Professor, Course ���̺��� �����Ͽ� ������ �������� ���� ������ ���
select *
    from Professor;

select *
    from Course;
    
select 
    p. professor_id,
    p. name
    from Professor p left join Course c on c.professor_id = p.professor_id
    where  c.professor_id is null;





-- 43. Course ���̺��� ��� �������� ���Ͽ� �����, ������ ����ϵ�, Professor ���̺��� �����Ͽ� 
--      ����ϰ� �ִ� ������ ������ȣ, ������ , ������ ����ϵ��� ��ü �ܺ� ���� (full join) �ϼ���
select *
    from Professor;

select *
    from Course;

select
    c. title,
    c. c_number,
    p. professor_id,
    p. name,
    p. position
    from course c full join professor p on p.professor_id = c.professor_id;





-- 44. ȸ��(EC_Member) , �ֹ�(EC_Order) ���̺��� �̿��Ͽ� �ѹ� �̻� �ŷ��� ȸ���� ȸ����, 
--      �ֹε�Ϲ�ȣ, ��ǰ��, �ֹ�����, �ֹ��ݾ��� ȸ��������� ���. (��������)
select *
    from EC_Member;
select *
    from EC_Order;
    
select 
    m.name,
    m.regist_no,
    o.product_code,
    o.order_qty,
    o.cmoney
    from ec_order o, EC_Member m
    where o.order_id = m.userid
    order by m.name;
    




-- 45. ȸ��(EC_Member), �ֹ�(EC_Order) ���̺��� �̿��Ͽ� �ѹ��� �ֹ����� ���� ȸ����, 
--      �ֹε�Ϲ�ȣ, ��ȭ��ȣ�� ���
select *
    from EC_Member;
select *
    from EC_Order;

select 
    m.userid,
    m.name,
    m.regist_no,
    m.telephone
    from EC_Member m
    where not exists
    ( select *
        from EC_Order o
        where m.userid = o.order_id)
    order by m.name;





-- 46. ȸ��(EC_Member), �ֹ�(EC_Order), ��ǰ(EC_Product) ���̺��� �̿��Ͽ� �������� '����' �� 
-- ȸ���߿��� �ѹ� �̻� �ֹ��� ȸ���� ȸ����, �ֹι�ȣ, ��ǰ��, �ֹ�����, �ܰ�, �������� ȸ��������� 
-- ���( ��������)

select 
    m.name,
    m.regist_no,
    o.product_code,
    o.order_qty,
    o.cmoney
    from ec_order o, EC_Member m
    where o.order_id = m.userid and m.address like '����%'
    order by m.name;
.
.
select *
    from EC_Member;
select *
    from EC_Order;
select *
    from EC_Product;





-- 47. T_SG_Scores, T_Course , Student ���̺��� �̿��Ͽ� 'C1801' �й��� ������ 
--     ������������ ��ȸ
select *
    from Student s , T_SG_Scores t  
    where s.Student_id = t.Student_id and s.Student_id = 'C1801';
.
.
select *
    from T_SG_Scores;
select *
    from T_Course;
select *
    from Student;
    
    



-- 48. T_SG_Scores, T_Course ���̺��� �̿��Ͽ� 'C1801' �й��� ��޿� ���� ����, 
--     ���� ������ ����ϼ���. ��, ������ ����� A+ �̸� 4.5, A �̸� 4.0, B+ �̸� 
--     3.5, B �̸� 3.0 , C+ �̸� 2.5, C �̸� 2.0, D+ �̸� 1.5, D �̸� 1.0, 
--      F �̸� 0.0 �̸�, ���� ������ "��޿� ���� ���� x ������"�� ����Ѵ�
select
    s.student_id, 
    s.course_id, 
    c.title, 
    s.grade,
    case when grade >= 4.5 then 'A+'
         when grade >= 4.0 then 'A'
         when grade >= 3.5 then 'B+'
         when grade >= 3.0 then 'B'
         when grade >= 2.5 then 'C+'
         when grade >= 2.0 then 'C'
         when grade >= 1.5 then 'D+'
         when grade >= 1.0 then 'D'
         else 'F'
         end as �������,
    s.grade * c.c_number as ��������
    from T_SG_Scores s left join T_Course c on s.course_id = c.course_id
    where s.student_id = 'C1801';

.
.
select *
    from T_SG_Scores;
select *
    from T_Course;
    
  
  

    
-- 49. SG_Scores ���̺��� 'L1031' 'SQL����' ������ ����� ����ϰ� 'L1031'  ������ 
--     ��� �������� ���� ������ ����Ͻÿ� ( �������� ���)
select *
    from SG_Scores s left join T_Course t on s.course_id = t.course_id
    where s.course_id != 'L1031' and
    s.score >= 
    (select 
    avg ( score )
    from SG_Scores s left join T_Course t on s.course_id = t.course_id
    where s.course_id = 'L1031' and t.title = 'SQL����');
.
.
select *
    from SG_Scores;
select *
    from T_Course;




-- 50. SG_Scores ���̺��� 'L1031' 'SQL����' ���񿡼� �������� ���� �л����� 
--     �й�, �����ڵ�, ����, ����������ڸ� ���
select 
    student_id, 
    course_id, 
    score, 
    score_assigned
    from sg_scores
    where course_id = 'L1031' and score =
    (select 
        min(score) 
        from sg_scores 
        where course_id = 'L1031');

select *
    from SG_Scores;
select *
    from T_Course;



--========================================================================

-- 2024-09-06 ����
-- hr ������ ���̽��� �ش� �������� ������ �ּ���.

--1. 2000�⿡ �Ի��ؼ� �ְ�޿��� 10000�� �Ѵ� �����ؼ� ���ϰ� �ִ� ����� ��ȸ
select *
    from employees
    where salary > 10000 and hire_date like '03/%';




--2. �Ŵ��� �̸��� 'MICHAEL' �� �μ��� ��ȸ
select 
    j.job_id,
    e.first_name,
    j.job_title
    from jobs j left join employees e on j.job_id = e.job_id
    where e.first_name = 'Michael' and j.job_title like '%Manager%' ;
    
    
    
    
--3. ������ �����޿��� ��� 105�� �޿����� ���� ������ ��ȸ
select
    distinct j.job_id
--    e.first_name,
--    e.salary
    from jobs j join employees e on j.job_id = e.job_id
    where salary < 
    (select
        salary
        from employees
        where employee_id = '105');




--4. ����� �̸��� �ش� ����� �Ŵ��� �̸��� ��ȸ
select
    e.employee_id as ������̵�,
    e.first_name as ����̸�,
    m.manager_id as �Ŵ������̵�,
    m.first_name as �Ŵ����̸�
    from employees e left join employees m on e.manager_id = m.employee_id
    order by e.employee_id;

select*
    from employees;

--5. �� �μ��� �������� ������� �� �޿����� ��ȸ
select 
    job_title,
    sum ( salary )
    from jobs j left join employees e on j.job_id = e.job_id
    group by job_title
    order by job_title;

--6. 30�� �μ��� �Ի��� ����� ���� �������� ��ȸ
select
    e.hire_date
    from departments d left join employees e on d.department_id = e.department_id
    where d.department_id = '30'
    order by hire_date;

--7. ������ �����޿��� �ְ�޿� ������ �޿��� ������ ����� �̸��� �������� ��ȸ
select
    e.first_name,
    j.job_title,
    e.salary
    from jobs j left join employees e on j.job_id = e.job_id
    where e.salary >= j.min_salary and e.salary <= j.max_salary
    order by j.job_title
;
    
select*
    from jobs;
    
    
    
-------------------------------------------------------------------------------- 
    
--8. Ŀ�̼��� ���� ����� ���� ���� ����� ���� ������� ��ȸ
select
--    commission_pct as Ŀ�̼�,
    count(*) as �޴��ο�,
    count(*) - count( 
        select
            commission_pct
            from employees
            where commission_pct is null
            ) as �����ʴ��ο�
    from employees
    where commission_pct is not null
;

select 
    count ( commission_pct ) as �޴»�� ,
    count (*) - count ( commission_pct ) as �����ʴ»��
    from employees;
    
  


--9. 2�� 28�Ͽ� �Ի��� ����� �̸�, ������, �μ����� ��ȸ
select
    e.hire_date,
    e.first_name,
    e.job_id,
    j.job_title
    from employees e left join jobs j on e.job_id = j.job_id
    where extract(month from e.hire_date) = '02' and extract(day from e.hire_date) = '28';
;

select*
    from employees
    order by hire_date;




--10. �����޿��� 10000���� ���� ������ ��� ������ ��ȸ
select *
    from jobs
    where min_salary > 10000;
.
.
select *
    from employees;
select *
    from jobs;
    
    
    

--11. 2002��~2005�� ���̿� �Ի��� ����� �̸��� �Ի����� ��ȸ
select 
    first_name,
    hire_date
    from employees
    where hire_date between to_date('02/01/01') and to_date('05/12/31')
    order by hire_date
;
.
.
select *
    from employees;




--12. IT Programmer �̰ų� Sales Man �� ����� �̸��� �Ի����� ��ȸ
select
    e.first_name,
    e.hire_date,
    j.job_title
    from jobs j left join employees e on j.job_id = e.job_id
    where j.job_title like '%Programmer%' or j.job_title like '%Sales%'
    order by e.first_name  
;
.
.
select *
    from jobs;





--13. 2008�� 1�� 1�� ���Ŀ� �Ի��� ����� ��ȸ
select *
    from employees
    where hire_date > '08/01/01'
    order by hire_date

;
.
.
select *
    from employees
    order by hire_date;





--14. ����� 150, 160 �� ����� ������ ��ȸ
select *
    from employees
    where employee_id = '150' or employee_id = '160'
;
.
.
select *
    from employees;






--15. �޿��� 10000���� ���� ����� �̸�, �޿�, Ŀ�̼�, �Ի����� ��ȸ
select 
    first_name,
    salary,
    commission_pct,
    hire_date
    from employees
    where salary < '10000'
    order by salary
;
.
.
select *
    from employees;






--16. �ְ� �޿��� 10000~20000 �� ������ ������, �����޿�, �ְ�޿��� ������ ��ȸ
select
    job_title as ������,
    min_salary as �����޿�,
    max_salary - min_salary as ����
    from jobs
    where max_salary between '10000' and '20000'
;
.
.
select *
    from employees;
select *
    from jobs;





--17. ����� �̸��� �޿��� ��ȸ�� �� �޿��� 1000������ ��ȸ�� �ּ���
select 
    first_name,
    to_char (salary , 'FM999,999')
    from employees
; 
.
.
select *
    from employees;





--18. �������� �������� �Ͽ� ������������ ���� ������ ��ȸ
select *
    from jobs
    order by job_title desc
;
.
.
select *
    from jobs;





--19. ���̳� �̸��� S �� �����ϴ� ����� ��ȸ
select *
    from employees
    where first_name like 'S%' or last_name like 'S%'
;
.
.
select *
    from employees;





--20. 5���� �Ի��� ����� ��ȸ
select *
    from employees
    where extract(month from hire_date) = '05'
;
.
.
select *
    from employees;





--21. Ŀ�̼��� ���� �ʰ�, �޿��� 5000~10000�̸鼭 30�� �μ��� �Ҽӵ� ����� ��ȸ
select *
    from employees
    where commission_pct is null and salary between '5000' and '10000' and department_id = '30'
;
.
.
select *
    from employees;





--22. ������� �̸��� ù �޿����� ��ȸ�� �ּ���. �ſ� 1���� �޿� �� �Դϴ�
select 
    first_name,
    trunc ( hire_date, 'MM' ) as �޿���
    from employees
    order by hire_date
;
.
.
select *
    from employees;






--23. ����� �̸��� �ټӿ����� ��ȸ
select 
    first_name,
    trunc (months_between( sysdate, hire_date ) / 12) as �ټӿ���
    from employees
;
.
.
select *
    from employees;






--24. 2001�� �Ի��� ����� �̸��� ��ȸ
select 
    first_name,
    hire_date
    from employees
    where hire_date like '01%'
    order by hire_date
;
.
.
select *
    from employees
    order by hire_date;






--25. ù ���ڴ� �빮�ڷ�, ������ ���ڴ� �ҹ��ڷ� ��ȯ�Ͽ� ���� �̸��� ��ȸ
select
    initcap (first_name),
    initcap (last_name)
    from employees
    order by first_name
    
;
.
.
select *
    from employees
;





--26. �������� ù �ܾ ��ȸ
select
    job_title,
    substr (job_title, 1, 1) as ù�ܾ�
    
    from jobs
;
.
.
select *
    from jobs
;






--27. ���� 3��° ���� ���Ŀ� b �� ���Ե� ����� �̸��� �̸��� ���̸� ��ȸ
select
    first_name as �̸�,
    last_name as ��,
    length ( first_name ) as �̸�����
    from employees
    where last_name like '___b%'
;
.
.
select *
    from employees;







--28. ����� �̸��� �빮�ڷ�, �̸��� �ּҴ� �ҹ��ڷ� ���
select
    upper ( first_name ),
    lower ( email )
    from employees

;
.
.
select *
    from employees;






--29. ���� �Ի��� ����� ��ȸ
select *
    from employees
    where hire_date = sysdate

;
.
.
select *
    from employees;






--30. ���� ��¥�� 2011�� 1�� 1���� ��ĥ �������� ���
select
    distinct (trunc (sysdate - to_date('2011-01-01', 'YYYY-MM-DD'))) as �����ϼ�
    from employees
    
;
.
.
select *
    from employees;



--31. ���� �� �޸��� �� ���� ����� �Ի��Ͽ����� ��ȸ
select
    to_char ( hire_date, 'YYYY-MM' ) as month,
    count(*)as �Ի��ο�
    from employees
    group by to_char ( hire_date, 'YYYY-MM' )
    order by to_char ( hire_date, 'YYYY-MM' )
;
.
.
select *
    from employees;






--32. �Ŵ��� ����� �� �Ŵ����� �� ����� �����ϴ��� ��ȸ
select
    manager_id as �Ŵ������,
    count(manager_id) as �����ο�
    from employees
    group by manager_id 
    order by manager_id
;
.
.
select *
    from employees
    order by employee_id;



--33. ��� ����� ���� ������ ������ ���� ��ȸ
select
    employee_id,
    trunc (sysdate - 1)
    from employees
    
;





--34. �Ի����� n�� '15��' ������(����̵� ������ �Ի���) ����� ���� ��ȸ
select
    hire_date as �Ի���,
    count(*) as �����
    from employees
    where extract (day from hire_date) = '15'
    group by hire_date
    order by hire_date
    
;
.
.
select *
    from employees;




--35. ������ȣ�� �ش� ������ �ִ� ���õ��� ������ ��ȸ
select 
    c.region_id as ������ȣ,
    c.country_id ,
    count(l.city) as ���ð���
    from countries c left join locations l on c.country_id = l.country_id
    group by c.region_id , c.country_id
    order by c.region_id
;
.
.
select *
    from countries
    order by region_id;
select *
    from locations
    order by country_id;





--36. �� �μ����� Ŀ�̼��� ���� ������� ��� �޿��� ��ȸ
select
    j.job_title as �μ��̸�,
    avg ( salary ) as ��ձ޿�
    from employees e left join jobs j on e.job_id = j.job_id
    where commission_pct is not null
    group by j.job_title
    
;
.
.
select *
    from employees;
select *
    from jobs;




--37. �������� ������, ����� ��, �޿��� ��, �ְ� �޿��� �����޿��� ������ ��ȸ
select
    j.job_title as ������,
    count (*) as �����,
    sum ( salary ) as �޿���,
    max_salary - min_salary as ����
    from jobs j left join employees e on j.job_id = e.job_id
    group by j.job_title, max_salary - min_salary
    order by job_title
    
;
.
.
select *
    from jobs;
select *
    from employees;
    
    
    
    

--38. ��ձ޿��� 10000�� �Ѵ� ������ ����ID�� ��� �޿��� ��ȸ
select
    e.job_id as ����ID,
    avg (e. salary) as ��ձ޿�
    from employees e left join jobs j on e.job_id = j.job_id
    where salary > '10000'
    group by e.job_id
    order by e.job_id
    
;
.
.
select *
    from employees;
select *
    from jobs;
    
    
    
    
--39. 10���� �Ѵ� ����� �Ի��� ������ ��ȸ
select
    to_char (hire_date, 'YYYY') as ����,
    count(*) as �Ի��ο�
    from employees
    group by to_char(hire_date, 'YYYY')
    having count(*) >= '10'
    
;
.
.
select *
    from employees;





--40. Ŀ�̼��� ���� ����� 5�� �̻��� �μ��� ��ȸ
select
    j.job_id as �μ�,
    count(*) as Ŀ�̼ǹ����ο�
    from jobs j join employees e on j.job_id = e.job_id
    where commission_pct is not null
    group by j.job_id
    order by j.job_id
;
.
.
select *
    from employees;
select *
    from jobs;



--41. ���ſ� �ϳ��� �Ѵ�(�ϳ� �̻� ���� �ʰ�)�� ������ �Ͽ��� ����� ����� ��ȸ
select  employee_id as ���,
        count(*) as �ϳ��̻�
        from job_history 
        group by employee_id
        having count(*) > '1'
        order by employee_id
;

.
.
select * 
    from employees;
select *
    from job_history;

    



--42. 3���� �Ѵ� ����� 100���� �Ѱ� �ٹ��� ����ID�� ��ȸ
select 
    department_id as ����ID,
    count (*)
    from job_history
    where trunc(end_date - start_date) > '100'
    group by department_id
    having count(*) >= '3'
;





--43. �μ� ��ȣ, ����, ������ �Ի��� ����� ���� �����Ͽ� ��ȸ
select
    to_char ( hire_date, 'YYYY' ) as �Ի翬��,
    count(*) as �����,
    e.department_id as �μ���ȣ
    from employees e join departments d on e.department_id = d.department_id
    group by to_char ( hire_date, 'YYYY'), e.department_id
    order by to_char ( hire_date, 'YYYY')
;
.
.
select *
    from employees;
select *
    from jobs;





--44. ������ �Ŵ����� 5�� �̻��� ����� �����ϰ� �ִ� �μ��� ��ȸ
select
    d.department_name,
    m.first_name as �Ŵ���,
    count(*) as �����ο�
    from employees e join employees m on e.manager_id = m.employee_id
    join departments d on e.manager_id = d.manager_id
    group by m.first_name , d.department_name
    having count(*) >= 5
    order by d.department_name
;
.
.
select *
    from employees;
select *
    from jobs;





--45. ��� 115�� ����� ���� �޿��� 6000�̸��� ��� 8000���� ����
select 
    employee_id as ���,
    salary as ����޿�,
    case 
    when salary < '6000' then '8000'
    end as ����޿�
    from employees
    where employee_id = '115'
;
.
.

select *
    from employees;




--46. 20�� �μ��� ����


delete from departments where department_id = '20';
-- 20	Marketing	201	1800
-- ���Ἲ ��������(HR.EMP_DEPT_FK)�� ����Ǿ����ϴ�- �ڽ� ���ڵ尡 �߰ߵǾ����ϴ�
-- �ܷ�Ű ����
-- ���Ἲ ��������(HR.JHIST_DEPT_FK)�� ����Ǿ����ϴ�- �ڽ� ���ڵ尡 �߰ߵǾ����ϴ�
-- �ܷ�Ű ����
-- �ذ�

select *
    from departments;
    




--47. ��� 110�� ����� 10�� �μ��� �����ְ� ���� ����ID�� IT�� �������� ������ �ش����� ������
--    ����� ����ID�� 'IT_PROG'�� ����
select *
    from employees
    where employee_id = '110' 
    and department_id = '10' 
    and job_id not like 'IT%'
;
.
.
select *
    from employees;





--48. �μ� ���̺� �Ŵ���ID�� 120�̰� ���ID�� ���� ���� ������ ��ҷ� �ϴ� ���� �߰�
insert into departments 
(department_id , department_name , manager_id , location_id )
values
( '300' , 'GUGU' , '120' , '1200' );

.
.
select *
    from departments;






--49. �μ� �̸��� �ش� �μ��� ����� ���� ��ȸ
select 
    department_name as �μ��̸�,
    count(*) as �����
    from departments d left join employees e on d.department_id = e.department_id
    group by department_name
    order by d.department_name
    
;
.
.
select *
    from departments;





--50. ������Ͽ��� 30�� �μ��� ��� ������ ���Ͽ� ������, ���, �����ϰ� ������ �� �ٹ��ϼ��� ��ȸ
select
    d.department_id as �μ���ȣ,
    j.job_id as ������,
    j.employee_id as ���,
    trunc ( j.end_date - j.start_date ) as �ٹ��ϼ�
    from departments d left join job_history j on d.department_id = j.department_id
    where d.department_id = '30'
;
.
.
select *
    from departments;
select *
    from job_history;
    
    
    
    
    
--51. �μ���� �Ŵ��� �̸��� ��ȸ
select
    d.department_name,
    e.first_name
    from departments d join employees e on d.department_id = e.department_id
    where d.manager_id = e.employee_id
    order by d.department_name
;




--52. �μ���� �Ŵ��� �̸�, ���ø� ��ȸ
select
    d.department_name,
    e.first_name,
    l.city
    from departments d join employees e on d.department_id = e.department_id
    join locations l on d.location_id = l.location_id
    where d.manager_id = e.employee_id
;


 
--53. ������, ����, �μ����� ��ȸ
select 
    c.country_name as ������,
    l.city as ����,
    d.department_name as �μ���
    from countries c join locations l on c.country_id = l.country_id 
    join departments d on d.location_id = l.location_id;
.
.
select *
    from countries;
select *
    from departments;
select *
    from locations;
    
    
    
    
    
--54. 2000~2005�� ������ ��� ������ ���Ͽ� ������, �μ���, ����� ��, ������������ ��ȸ
select
    e.job_id as ������,
    d.department_name as �μ���,
    e.last_name as ����Ǽ�,
    e.hire_date as ����������
    from employees e join departments d on e.department_id = e.department_id
    join job_history j on d.department_id = j.department_id
    where e.hire_date between '2002/01/01' and '2005/12/31'
    order by e.hire_date
;
.
.
select *
    from employees;
select *
    from departments;
select *
    from job_history;





--55. ������� ������� ��ձ޿��� ��ȸ
select
    job_id,
    trunc (avg ( salary ))
    from employees
    group by job_id
    order by job_id
;
.
.
select *
    from employees;
select *
    from departments;





--56. ������, ��� �̸�, �ش� ����� �޿��� �ش� ������ �ְ�޿� ���� ������ ��ȸ
select
    e.job_id as ������,
    e.first_name as ����̸�,
    e.salary as �޿�,
    j.max_salary - j.min_salary as ����
    from employees e join jobs j on e.job_id = j.job_id
    order by e.job_id
;
.
.
select *
    from employees;
select *
    from jobs;





--57. Ŀ�̼��� �ް� 30�� �μ��� ���� ����� ��, �������� ��ȸ
select
    e.last_name,
    e.job_id
    from employees e join departments d on e.department_id = d.department_id
    where e.commission_pct is not null and d.department_id = '30'
;
.
.
select *
    from employees;
select *
    from departments;





--58. ���� �޿��� 15000 �̻��� ����� ���ݱ��� �����ߴ� �������� ��ȸ
select
    e.first_name,
    e.job_id
    from employees e join job_history j on e.employee_id = j.employee_id
    where salary > '15000'
;
.
.
select *
    from employees;
select *
    from job_history;
    




--59. 5�� �̻� �ٹ��� ��� �Ŵ������� �μ���, �Ŵ��� �̸�, �Ŵ����� �޿��� ��ȸ
select
    d.department_name as �μ���,
    e.first_name as �Ŵ����̸�,
    e.salary as �޿�,
    e.hire_date as �ٹ�������,
    trunc (( sysdate - hire_date ) / 365 , 1) as ����
    from employees e join departments d on e.department_id = d.department_id
    where e.employee_id = d.manager_id and trunc (( sysdate - hire_date ) / 365 , 1) >= '5'
    order by e.hire_date
;
.
.
select *
    from employees;
select *
    from departments;



--60. �ڽ��� �Ŵ������� ���� �Ի��� ��� �̸��� ��ȸ
select
    e.first_name as ����̸�,
    e.employee_id as �����ȣ,
    e.hire_date as ����Ի���,
    m.first_name as �Ŵ����̸�,
    e.manager_id as �Ŵ�����ȣ,
    m.hire_date as �Ŵ����Ի���
    from employees e join employees m on e.manager_id = m.employee_id
    where e.hire_date < m.hire_date
    order by e.employee_id

;
.
.
select *
    from employees;




--61. ����� 6���� �̸����� �ٹ��� ������ ���Ͽ� ��� �̸�, �������� ��ȸ
select 
    first_name as ����̸�,
    job_id as ������,
    trunc (( sysdate - hire_date ) / 12 ) as �ټӰ�����
    from employees
    where trunc (( sysdate - hire_date ) / 12 )  < '6'
; 
.
.
select *
    from employees;



--62. ����� �̸��� �� ����� �ٹ��ϴ� ������ ��ȸ
select 
    e.first_name as ����̸�,
    e.last_name as �����,
    c.country_name as �����̸�
    from employees e join departments d on e.department_id = d.department_id
    join locations l on d.location_id = l.location_id
    join countries c on l.country_id = c.country_id
    order by first_name
;
.
.
select *
    from employees
    order by commission_pct;



--63. �μ���, ��ձ޿�, �μ� ������ Ŀ�̼��� ���� ����� ���� ��ȸ
select
    d.department_name as �μ���,
    trunc (avg ( salary )) as ��ձ޿�,
    count(commission_pct) as Ŀ�̼ǹ޴»����
    from departments d join employees e on d.department_id = e.department_id
    group by d.department_name
;

select *
    from departments;
select *
    from employees
    order by commission_pct;



--64. �þ�Ʋ�� ��ġ�� �μ� ���� ����� 5�� �̻� �Ի��� ���� ��ȸ
select
    l.city as �þ�Ʋ,
    extract(month from e.hire_date)as ��,
    count(*) as �Ի��ο�
    from locations l join departments d on l.location_id = d.location_id
    join employees e on e.department_id = d.department_id
    where l.city = 'Seattle'
    group by extract(month from e.hire_date) , l.city
    having count(*) >= '5'
    order by extract(month from e.hire_date)
    
;



--65. �ְ�޿��� 10000�� �Ѵ� �μ��� ������ ��ȸ
select 
    d.department_name as �μ��̸�,
    d.department_id as �μ����̵�,
    j.max_salary as �ְ�޿�
    from departments d join employees e on d.department_id = e.department_id
    join jobs j on j.job_id = e.job_id
    where j.max_salary > '10000'
    group by d.department_name, d.department_id , j.max_salary
    order by d.department_name

;
.
.
select *
    from jobs;
select *
    from departments;





--66. 'Smith'�� ���� �����Ǵ� �μ��� ������ ��ȸ
select
    e.last_name as �̸�,
    e.employee_id as �����ȣ,
    d.department_id as �μ���ȣ,
    d.department_name as �μ��̸�
    from departments d join employees e on d.department_id = e.department_id
    where e.last_name = 'Smith'
;
.
.

select *
    from departments;
select *
    from employees;



--67. ���� �Ի��� ����� ���� ������ ��ȸ
SELECT 
    JOB_ID,
    first_name
FROM EMPLOYEES
WHERE HIRE_DATE IN (SELECT HIRE_DATE
                    FROM EMPLOYEES
                    WHERE HIRE_DATE >= '20240101')
order by first_name
;
.
.
SELECT *
    FROM EMPLOYEES;
    


--68. ���ſ� �ٸ� ��� ������ �������� ���� ����� ��ȸ
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID NOT IN ( SELECT DEPARTMENT_ID
                             FROM JOB_HISTORY );
.
.
SELECT *
    FROM JOB_HISTORY;
SELECT *
    FROM EMPLOYEES;
    
    
    
--69. ���ſ� �ٸ� ������ �� ���� �ִ� ����� ������ ��� �޿��� ��ȸ
SELECT 
    EMPLOYEE_ID,
    JOB_ID AS �������, 
    TRUNC (AVG ( SALARY )) AS ��ձ޿�
FROM EMPLOYEES
WHERE EMPLOYEE_ID IN ( SELECT EMPLOYEE_ID
                         FROM JOB_HISTORY )
GROUP BY JOB_ID, EMPLOYEE_ID
ORDER BY EMPLOYEE_ID;

.
.
SELECT *
    FROM JOB_HISTORY
    ORDER BY EMPLOYEE_ID;
SELECT *
    FROM EMPLOYEES;



--70. 5�� �̻��� ����� ���� �μ��� �����Ͽ� �μ��� �ִ� ������, ����, �� �μ��� ���� ��ȸ
SELECT
    E.DEPARTMENT_ID AS �μ���ȣ,
    COUNT(*) AS �μ��ο�,
    C.COUNTRY_NAME AS �����̸�, 
    L.CITY AS �����̸�
FROM  EMPLOYEES E , DEPARTMENTS D , LOCATIONS L , COUNTRIES C
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID AND 
      D.LOCATION_ID = L.LOCATION_ID AND
      L.COUNTRY_ID = C.COUNTRY_ID
GROUP BY E.DEPARTMENT_ID, C.COUNTRY_NAME, L.CITY
HAVING COUNT(*) >= 5 ;

.
.
SELECT *
    FROM JOBS;
SELECT *
    FROM EMPLOYEES;

--71. 5�� �̻��� ����� �����ϴ� �Ŵ��� ������ ��ȸ
select 
    m.employee_id as �����ȣ,
    m.first_name as �Ŵ����̸�,
    m.job_id as ����,
    count(*) as �����ο�
    FROM employees e join employees m on e.manager_id = m.employee_id
    group by m.first_name, m.employee_id, m.job_id
    having count(*) > 5
    order by m.employee_id;


select 
    e.employee_id,
    e.first_name,
    m.manager_id,
    m.first_name
    FROM employees e join employees m on e.manager_id = m.employee_id;
.
.
SELECT *
    FROM EMPLOYEES;
    
    
    
    
--72. Ŀ�̼��� �������� ������� ��� �̸�, ���� ������, ����������, ������������ ��ȸ
SELECT
    e. first_name,
    j.job_id,
    j.start_date,
    j.end_date
    FROM EMPLOYEES e join job_history j on e.employee_id = j.employee_id
    where commission_pct is null
;
.
.
SELECT *
    FROM EMPLOYEES;
SELECT *
    FROM JOB_HISTORY;



--73. ���� 2�� �� ����� ���� ������ ���� �μ��� ��ȸ
SELECT
    distinct d.department_name
    FROM EMPLOYEES e join departments d on e.department_id = e.department_id
    WHERE HIRE_DATE NOT BETWEEN '2022/09/09' AND '2024/09/09'
;
.
.
SELECT *
    FROM EMPLOYEES;




--74. ���ſ� �ٸ� ������ �����ߴ� ����� �߿� �ְ�޿��� 10000 �̻��� ����� ���� �μ� ���� ��ȸ
SELECT
    e.employee_id as �����ȣ,
    e.first_name as ����̸�,
    d.department_id as �μ���ȣ,
    d.department_name as �μ��̸�
    FROM EMPLOYEES e join JOB_HISTORY j on e.employee_id = j.employee_id
    join DEPARTMENTS d ON d.department_id = e.department_id
    where e.salary >= '10000'
    order by e.employee_id
;
.
.
SELECT *
    FROM DEPARTMENTS;
SELECT *
    FROM JOB_HISTORY;
SELECT *
    FROM EMPLOYEES;
    
    
    
--75. ���ſ� IT Programmer�� ���ߴ� ������� ���� ������ ��ȸ
SELECT
    e.EMPLOYEE_ID as �����ȣ,
    e.first_name as ����̸�,
    e.JOB_ID as �������,
    j.job_id as ���ž���
    FROM EMPLOYEES e JOIN JOB_HISTORY j on e.EMPLOYEE_ID = j.EMPLOYEE_ID
    WHERE e.employee_id IN ( SELECT employee_id
                                FROM JOB_HISTORY
                                where job_id like 'IT%')                              
;
.
.
SELECT *
    FROM DEPARTMENTS;
SELECT *
    FROM JOB_HISTORY;
SELECT *
    FROM EMPLOYEES;

--76. ����� 105���� ����� �ִ� ���ø� ��ȸ

SELECT
    e.employee_id as ���,
    e.first_name as ����̸�,
    l.city as ����
FROM EMPLOYEES e join DEPARTMENTS d on e.department_id = d.department_id
join LOCATIONS L on d.location_id = l.location_id
WHERE e.employee_id = '105';


SELECT *
    FROM LOCATIONS;
SELECT *
    FROM DEPARTMENTS;
SELECT *
    FROM EMPLOYEES;




--77. ��� ����� �� 3��°�� ���� �޿��� ������ ��ȸ
SELECT 
    SALARY as �޿�,
    dense_rank() over ( order by salary desc) as �޿���ŷ
    FROM EMPLOYEES
;

SELECT SALARY as "3��°�����޿�"
    FROM ( 
          select rownum as rn, salary
            from ( 
                  select distinct salary
                      from EMPLOYEES
                      where salary is not null
                      order by salary desc 
                  )
         )
    where rn = 3;

.
.
SELECT *
    FROM EMPLOYEES
    order by salary desc;



human �����ͺ��̽����� EC_Order ���� �÷��� csel �� varchar2(20) ���� �����Ͻð�
alter table EC_Order modify csel varchar2(20);

INSERT INTO EC_Order VALUES ('180205001','usko',  'NB01', 1,'�ſ�ī��', 930000,'2018/02/15','2018/02/16','���');
INSERT INTO EC_Order VALUES ('180204001','supark','NB02', 1,'�����Ա�', 750000,'2018/02/24','2018/02/25','���');
INSERT INTO EC_Order VALUES ('180311001','supark','PRT01',1,'�����Ա�', 235000,'2018/03/11','2018/03/12','���');
INSERT INTO EC_Order VALUES ('180315001','imjung','TV03', 1,'�ſ�ī��',1785000,'2018/03/15','2018/03/17','���');
INSERT INTO EC_Order VALUES ('180403001','uskang','PRT03',1,'�����Ա�', 272000,'2018/04/03','2018/04/05','���');
INSERT INTO EC_Order VALUES ('180412001','cscho', 'CM03', 1,'������ü', 740000,'2018/04/12','2018/04/15','���');
INSERT INTO EC_Order VALUES ('180505001','jskang','TV01', 1,'������ü',1060000,'2018/05/07',Null,        '���'); 
INSERT INTO EC_Order VALUES ('180505002','kcchoi','DK01', 1,'�ſ�ī��',  53000,'2018/05/07',Null,        '����');
INSERT INTO EC_Order VALUES ('180505003','kcchoi','CH01', 1,'������ü',  70000,'2018/05/07',Null,        '����');
INSERT INTO EC_Order VALUES ('180707001','jupark','CM01', 5, Null,     3735000, Null,       Null,        Null);
INSERT INTO EC_Order VALUES ('180707002','jupark','PRT02',5, Null,     4300000, Null,       Null,        Null);
INSERT INTO EC_Order VALUES ('180707003','cscho', 'CM01' ,1, Null,      747000, Null,       Null,        Null);
�ٽ� ������ �Է��ϼ���

-- �Է�



create or replace view home
as
    select
    e.employee_id,
    d.department_id,
    e.first_name,
    e.last_name,
    e.hire_date,
    e.job_id,
    e.salary,
    e.manager_id,
    d.location_id
    from employees e join departments d on e.department_id = d.department_id
    with read only;

create or replace view home
as
    select
    e.employee_id,
    d.department_id,
    e.first_name,
    e.last_name,
    e.hire_date,
    e.job_id,
    e.salary,
    e.manager_id,
    d.location_id,
    l. country_id
    from employees e left join departments d on e.department_id = d.department_id
    join locations l on d.location_id = l.location_id
    with read only;


select *
    from home
    order by employee_id;

select *
    from employees e left join home h on e.employee_id = h.employee_id
    order by e.employee_id;
select *
    from locations;
select *
    from departments;

drop view home;







