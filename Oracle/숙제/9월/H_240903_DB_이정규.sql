
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
select comm, nvl(comm, 0) 
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
    
-- 37) ����� �Ի����� 1981�� 2�� 20�� ~ 1982�� 1�� 23�ϱ��� ��� ������ ��ȸ
select *
    from emp
    where hiredate >= '1981-02-20' and hiredate <= '1982-01-23';
    
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
select job, sal, decode ( job, 'SALESMAN', sal*0.15, 'MANAGER', sal*0.10, sal*0.05) as "�޿��λ�"
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
    
select course_id, title, c_number, ( c_number * 30000 + course_fees ) as �߰�������
    from course
    order by '�߰�������' desc, course_id asc;
    
-- 56) Professor ���̺��� '�İ�'�а��� �������� ��ȸ
select name
    from professor
    where dept_id = '�İ�';
    
-- 57) Course ���̺�κ��� �߰� �����ᰡ 30000�� �̻��� ������� ��ȸ�ϵ�, �߰� �����Ḧ ������������ ��ȸ
select course_fees
    from course
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
    where timestamp > '2018-05-01';
    
-- 89) ��ǰ����(EC_Product) ���̺��� ��ǰ���� '��Ʈ'�� �����ϴ� ��ǰ�� 
--     ��ǰ�ڵ�, ��ǰ��, ����, �ܰ�, ������, ����ó�� ����ó������ ��ȸ
select product_code, product_name, unit, unit_price, left_qty, company
    from ec_product
    where product_name like '%��Ʈ%';
    
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




    