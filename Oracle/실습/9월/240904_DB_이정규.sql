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

select 
    avg ( salary )
    from employees
    where salary > 
;
    
-- ������ �߰�
-- inser into ���̺�� ( �÷���1, �÷���2 ... )
--                 values ( ��1.        ��2,      ...) ; 

insert into employees (employee_id, first_name, last_name, email, hire_date, salary, job_id)
values ( 1000, 'JungGyu' , 'Lee' , 'junggyu@junggyu.com' , '2024-09-04' ,10000 ,'IT_PROG' )
;

select 
    employee_id
    from employees;

-- 17�� �Է�

insert into employees (employee_id, first_name, last_name, email, hire_date, salary, job_id)
values ( 1000, 'JungGyu' , 'Lee' , 'junggyu@junggyu.com' , '2024-09-04' ,10000 ,'IT_PROG' )
;
insert into employees (employee_id, first_name, last_name, email, hire_date, salary, job_id)
values ( 1001, 'NamHee' , 'Shim' , 'NamHee@human.com' , '2024-09-04' ,500 ,'IT_PROG' )
;

insert into employees (employee_id, first_name, last_name, email, hire_date, salary, job_id)
values ( 1002, 'Byeong Jin' , 'Seol' , 'Byeong@human.com' , '2024-09-04' ,500 ,'IT_PROG' )
;

insert into employees (employee_id, first_name, last_name, email, hire_date, salary, job_id)
values ( 1003, 'JinBae' , 'Moon' , 'JinBae@human.com' , '2024-09-04' ,500 ,'IT_PROG' )
;

insert into employees (employee_id, first_name, last_name, email, hire_date, salary, job_id)
values ( 1004, 'HyunSeop' , 'Park' , 'HyunSeop@human.com' , '2024-09-04' ,500 ,'IT_PROG' )
;

insert into employees (employee_id, first_name, last_name, email, hire_date, salary, job_id)
values ( 1005, 'JiHoon' , 'Jeon' , 'JiHoon@human.com' , '2024-09-04' ,500 ,'IT_PROG' )
;

insert into employees (employee_id, first_name, last_name, email, hire_date, salary, job_id)
values ( 1006, 'TaeWoong' , 'Lee' , 'TaeWoong@human.com' , '2024-09-04' ,500 ,'IT_PROG' )
;

insert into employees (employee_id, first_name, last_name, email, hire_date, salary, job_id)
values ( 1007, 'YongJun' , 'Jo' , 'YongJun@human.com' , '2024-09-04' ,500 ,'IT_PROG' )
;

insert into employees (employee_id, first_name, last_name, email, hire_date, salary, job_id)
values ( 1008, 'SeoHyeon' , 'Kim' , 'SeoHyeon@human.com' , '2024-09-04' ,550 ,'IT_PROG' )
;

insert into employees (employee_id, first_name, last_name, email, hire_date, salary, job_id)
values ( 1009, 'SoonGu' , 'Kang' , 'SoonGu@human.com' , '2024-09-04' ,500 ,'IT_PROG' )
;

insert into employees (employee_id, first_name, last_name, email, hire_date, salary, job_id)
values ( 1010, 'Gunwoo' , 'Kim' , 'Gunwoo@human.com' , '2024-09-04' ,500 ,'IT_PROG' )
;

insert into employees (employee_id, first_name, last_name, email, hire_date, salary, job_id)
values ( 1011, 'SiHoo' , 'Lim' , 'SiHoo@human.com' , '2024-09-04' ,500 ,'IT_PROG' )
;


insert into employees (employee_id, first_name, last_name, email, hire_date, salary, job_id)
values ( 1012, 'Hyemin' , 'Kim' , 'Hyemin@human.com' , '2024-09-04' ,500 ,'IT_PROG' )
;

insert into employees (employee_id, first_name, last_name, email, hire_date, salary, job_id)
values ( 1013, 'SangMin' , 'Yun' , 'SangMin@human.com' , '2024-09-04' ,500 ,'IT_PROG' )
;

insert into employees (employee_id, first_name, last_name, email, hire_date, salary, job_id)
values ( 1014, 'SangHyoung' , 'Lee' , 'SangHyoung@human.com' , '2024-09-04' ,500 ,'IT_PROG' )
;

insert into employees (employee_id, first_name, last_name, email, hire_date, salary, job_id)
values ( 1015, 'HeeCheol' , 'Shin' , 'HeeCheol@human.com' , '2024-09-04' ,500 ,'IT_PROG' )
;

insert into employees (employee_id, first_name, last_name, email, hire_date, salary, job_id)
values ( 1016, 'SooSin' , 'Park' , 'SooSin@human.com' , '2024-09-04' ,600 ,'IT_PROG' )
;

insert into employees (employee_id, first_name, last_name, email, hire_date, salary, job_id)
values ( 1017, 'MinSu' , 'Lee' , 'MinSu@human.com' , '2024-09-04' ,500 ,'IT_PROG' )
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
insert into employees (employee_id, first_name, last_name, email, hire_date, salary, job_id)
values ( 2000, 'temp' , 'temp' , 'temp' , '2024-09-04' ,500 ,'IT_PROG' )
;

delete
    from employees 
    where employee_id = 2000
;
-- 2000	temp	temp	temp		2024-09-04	IT_PROG	500			

select *
    from employees 
    where employee_id = 2000
;