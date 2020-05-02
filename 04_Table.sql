-- 1-1. �л�(STUDENT) ���̺� 
CREATE TABLE student(
    stu_no CHAR(9),                     -- �й�   
    stu_name VARCHAR2(12),         -- �̸�
    stu_dept VARCHAR2(20),          -- �а�
    stu_grade NUMBER(1),             -- �г�
    stu_class CHAR(1),                   -- ��
    stu_gender CHAR(1),                -- ����
    stu_height NUMBER(5,2),           -- ����
    stu_weight NUMBER(5,2),          -- ü��
    CONSTRAINT p_stu_no PRIMARY KEY(stu_no)
);

-- 1-2. �л�(STUDENT) ���ڵ�
INSERT INTO student VALUES(20153075, '���Ѻ�', '���', 1, 'C', 'M', 177.8, 80);
INSERT INTO student VALUES(20153088, '���¿�', '���', 1, 'C', 'F', 162.2, 50);
INSERT INTO student VALUES(20143054, '������', '���', 2, 'C', 'F', 154.3, 47);
INSERT INTO student VALUES(20152088, '���ο�', '��������', 1, 'C', 'M', 188.7, 90);
INSERT INTO student VALUES(20142021, '�ɼ���', '��������', 2, 'A', 'F', 168, 45);
INSERT INTO student VALUES(20132003, '����ö', '��������', 3, 'B', 'M', null, 63);
INSERT INTO student VALUES(20151062, '������', '��ǻ������', 1, 'B', 'M', 166, 67);
INSERT INTO student VALUES(20141007, '������', '��ǻ������', 2, 'A', 'M', 174, 64);
INSERT INTO student VALUES(20131001, '������', '��ǻ������', 3, 'C', 'M', null, 72);
INSERT INTO student VALUES(20131025, '������', '��ǻ������', 3, 'A', 'F', 177, 63);
SELECT * FROM student;

-- 2-1. ����(SUBJECT) ���̺� 
CREATE TABLE subject(
    sub_no CHAR(3),                         -- �����ȣ
    sub_name VARCHAR2(30),             -- �����̸� 
    sub_prof VARCHAR2(12),              -- ������
    sub_grade NUMBER(1),                -- �г�
    sub_dept VARCHAR2(20),              -- �а�
    CONSTRAINT p_sub_no primary key(sub_no)
);

-- 2-2. ����(SUBJECT) ���ڵ�
INSERT INTO subject VALUES('111', '�����ͺ��̽�', '���翵', 2, '��ǻ������');
INSERT INTO subject VALUES('110', '�ڵ�����', '������', 2, '��������');
INSERT INTO subject VALUES('109', '�ڵ�ȭ����', '�ڹο�', 3, '���');
INSERT INTO subject VALUES('101', '��ǻ�Ͱ���', '������', 3, '��ǻ������');
INSERT INTO subject VALUES('102', '�����۹�', '���¿�', 1, '���');
INSERT INTO subject VALUES('103', '�������ڽ���', '������', 1, '��������');
INSERT INTO subject VALUES('104', '�ý��ۺм�����', '������', 3, '��ǻ������');
INSERT INTO subject VALUES('105', '����Ҽ���', '���', 1, '���');
INSERT INTO subject VALUES('106', '����ȸ�ν���', '�ֿ���', 3, '��������');
INSERT INTO subject VALUES('107', 'CAD����ǽ�', '������', 2, '���');
INSERT INTO subject VALUES('108', '����Ʈ�������', '�ǹμ�', 1, '��ǻ������');
SELECT * FROM subject;

-- 3-1. ����(ENROL) ���̺�
CREATE TABLE enrol(
    sub_no CHAR(3),
    stu_no CHAR(9),
    enr_grade NUMBER(3),
    CONSTRAINT p_course PRIMARY KEY(sub_no, stu_no)
);

-- 3-2. ����(ENROL) ���ڵ�
INSERT INTO enrol VALUES('101', '20131001', 80);
INSERT INTO enrol VALUES('104', '20131001', 56);
INSERT INTO enrol VALUES('106', '20132003', 72);
INSERT INTO enrol VALUES('103', '20152088', 45);
INSERT INTO enrol VALUES('101', '20131025', 65);
INSERT INTO enrol VALUES('104', '20131025', 65);
INSERT INTO enrol VALUES('108', '20151062', 81);
INSERT INTO enrol VALUES('107', '20143054', 41);
INSERT INTO enrol VALUES('102', '20153075', 66);
INSERT INTO enrol VALUES('105', '20153075', 56);
INSERT INTO enrol VALUES('102', '20153088', 61);
INSERT INTO enrol VALUES('105', '20153088', 78);
SELECT * FROM enrol;

-- 4. Non-Eqaul-Join-Talbe

CREATE TABLE grade(
  score_name VARCHAR2(10) UNIQUE,
  score_from NUMBER(3),
  socre_to NUMBER(3)
);

INSERT INTO grade VALUES('A', 90, 100);
INSERT INTO grade VALUES('B', 80, 89);
INSERT INTO grade VALUES('C', 70, 79);
INSERT INTO grade VALUES('D', 60, 69);
INSERT INTO grade VALUES('E', 50, 59);
INSERT INTO grade VALUES('F', 0, 49);

SELECT * FROM GRADE;