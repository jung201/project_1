
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
