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
    
    
-- ����

-- 3) ����� ����� �̸����� ��ȸ
select employee_id, email from employees;

-- 4) ���� �̷¿� �ִ� ������� ���, ���� ������, �۾� ������ ��ȸ
select employee_id, start_date, end_date from job_history;

-- 5) ������ ������, �ּ� �޿�, �ִ� �޿��� ��ȸ
select job_title, min_salary, max_salary from jobs;

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

-- ���� 
-- 6) ����� ���� ���̵� (����)�� �޿��� ��ȸ�ϰ� �ߺ��� ��� ���� ���� ������ ���̸� �˾ƺ�����
select job_id, salary
    from employees;
-- 107��
    
select distinct job_id, salary
    from employees;
-- 82��

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

-- ����
-- 7) ���� ���̵� 'FI_ACCOUNT' �� �ƴ� �������̵� ������ ��ȸ
select *
    from jobs
where job_id != 'FI_ACCOUNT';

-- 8) 2003�� 9�� 17�� ���Ŀ� �Ի��� ����� ���, �����, ��ȭ��ȣ�� ����
select employee_id, hire_date, phone_number
    from employees
where hire_date > '2003-09-17';












