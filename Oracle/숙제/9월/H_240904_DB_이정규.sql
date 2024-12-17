
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

------------------------------------------------------------- XXXXX
-- 5) ����� �ٹ� ���, ����, �ϼ��� ��ȸ
select ename as "�̸�"  , sysdate as "����" , hiredate
    from emp;
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

-- 25) ������ Email ������ �����θ��� 'cyber' ���� 'dream' ���� ����Ǿ��� . �̸� �����Ͽ� ����������� ���
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
    100 / 3  as "��",
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
    
----------------------------------------------------------------------------XXXXX

-- 31) Student ���̺��� �ֹε�Ϲ�ȣ�� �̿��Ͽ� ��������� �����ϰ� ��¥�� �����ͷ� 
--      'RRMMDD', 'YYMMDD' �� ���� ��ȯ�Ͽ� 'YYYY/MM/DD' �������� ���
select
    to_char ( ( substr ( id_number , 1 , 6 ) ) , 'yymmdd' )
from student
;

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
    to_char ( course_fees * c_number, '999,999' ) as "999,999",
    to_char ( course_fees * c_number, 'L999,999' )as "L999,999",
    to_char ( course_fees * c_number, 'C999G999' )as "C999G999"
    from course
    where course_fees * c_number = 40000
;

-- 38) Course ���̺��� �߰� �����ᰡ 4���� (4 * 10**4) �� ���� ���Ͽ� ���ڿ��� ��ȯ�Ͽ� 
--     '9.99EEEE' ������������ ��ȯ�Ͽ� ���
select 
    to_char ( course_fees * c_number, '9.99EEEE' ) as "9.99EEEE"
    from course
    where course_fees * c_number = 40000
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
    course_fees + (course_fees * 0.05)
    from course
;

-- 43) '��ǻ�Ͱ��а�' �л��� �ֹε�Ϲ�ȣ�� �̿��Ͽ�, 
--     �����ڵ尡 '1'�� '3' �� �� '��', '2'�� '4' �� �� '��'�� ��ȭ�Ͽ� ���, decode �� ���
select 
    id_number as "�ֹι�ȣ",
    decode 
    (substr(id_number , 8 ,1), 
    '1' , '����' , '3' , '����',
    '2' , '����' , '4' , '����') as "�ֹι�ȣ ����" 
    from student
;

-------------------------------------------------------------------------XXXXX
-- 44)'C1601' �й��� ���Ͽ� SG_Scores ���̺��� ������ 
--    'A'(90~100), 'B'(80~89), 'C'(70~79), 'D'(60~69), 'F'(0~59) 
--    ������� ��ȯ�Ͽ� �����ڵ������ ���, case when ���
select 
    score
    case when score >= '90' then 'a'
         when score >= '80' then 'b'
         when score >= '70' then 'c'
         when score >= '60' then 'd'
         else 'F'
    end as '���'
    from sg_scores
    where student_id = 'C1601'
;
----------------------------------------------------------------------------------
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
    max ( score ) as "�ְ�����",
    min ( score ) as "��������",
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

------------------------------------------------------------------------XXXXX

-- 57) SG_Scores ���̺��� �й����� 8���� �̻��� ����� �й��� ������� ����� �й������� ��ȸ



--------------------------------------------------------------------------XXXXX

-- 58) Student ���̺�κ��� �а���/�г⺰ �ο����� ����Ͽ� �а���/�г⺰�� ��ȸ


    
-------------------------------------------------------------------------XXXXX

-- 59) �ֹ�ó��(EC_Order) ���̺��� ������ ����������� �������, �ֹ��Ǽ�, 
--     �ֹ����� �հ�,  �����ݾ� �հ� �� ����Ͽ� ������������� ���


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
    
-------------------------------------------------------------------------XXXXX

-- 61) �ֹ�ó��(EC_Order) ���̺��� ����� �����ݾ��� ���� ���� �ݾ��� ��������������� ���


 
--------------------------------------------------------------------------------

