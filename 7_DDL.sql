--������ ?�� ERROR�� �˻��ϼ���!


/*
    1.����Ŭ �⺻ ���
        1)Relation : ���̺�
        2)Tuple:���ڵ�(��)
        3)Attribute:�÷�(��)
        4)Domain:�Ӽ��� ����
            4-1)�ܼ� ������(Simple Domain) : �ܼ��Ӽ�
            4-2)���� ������(Complex Domain) : ���ռӼ�, �ܼ� ������ ���� (��) ��¥
            4-3)��ġ ������(Multivalued Domain) : ��ġ�Ӽ�, �ϳ��� �Ӽ��� �������� ���� ���´�. (��: �޸��� ��̼Ӽ� ����)
    
    2. ����Ŭ ������ �Ӽ�
    1)���� / ���� 
        1-1)��������:integer,float,double,char(n) (char(4)) // 
        1-2)��������:varchar(n), varchar2(2), number(n), number(p,s)//��ü�ڸ���(�Ҽ�������),�Ҽ� �ڸ���
    2)�� ¥ : DATE, TIMESTMP
    3)LONG : 2GB ���� ������
    4)LOB : 4GB �ؽ�Ʈ, ������, �̹���, ����
    5)ROWID : ���̺� ���� ������ ��ġ(�����ּ�)�� ǥ��
*/
--    ������ ���Ǿ�(DDL: DATA DEFINITION LANGUAGE)
--    3.���̺� : ��� ���� ������ 2���� ���̺�� �����͸� �����ϴ� ��ü
--    3-1) ���̺� ���� : CREATE TABLE ���̺�� ((�÷��� �ڷ���), ...)
    CREATE TABLE PERSON(
        bunho NUMBER(4),
        name VARCHAR2(20),
        ki NUMBER(5,1)
    );
    --���̺� ����
    DESC PERSON;
    --���ϰ����� ��� ���̺� ����
    SELECT * FROM TAB; 
--    3-2) ���̺� ���� : DROP TALBE ���̺��
    DROP TABLE PERSON;
    
    CREATE TABLE addr(
        irum VARCHAR2(15),
        phone VARCHAR2(15),
        address VARCHAR2(50),
        email VARCHAR2(15)
    );
--    3-3) ���̺� ���� : 
    CREATE TABLE addr(
        irum VARCHAR2(15),
        phone VARCHAR2(15),
        address VARCHAR2(50),
        email VARCHAR2(15)
    );
    SELECT * FROM ADDR;
    
    --1) �÷��߰� ALTER TABLE ���̺�� ADD(�÷��� �ڷ���(ũ��), ...);
    ALTER TABLE ADDR ADD(TEL VARCHAR2(15));
    
    --2) �÷�����/�÷��� ����
    --  2-1) �ڷ��� ���� : ALTER TABLE ���̺�� MODIFY(�÷��� �ڷ���, ...); 
          ALTER TABLE ADDR MODIFY(TEL VARCHAR2(20)); 
    --  2_2) �÷��� ���� : ALTER TABLE ���̺�� RENAME COLUMN �����÷��� TO ���ο� �÷��� 
          ALTER TABLE ADDR RENAME COLUMN TEL TO TELNET;
    --3) �÷����� : ALTER TABLE ���̺�� DROP COLUMN �÷���;
          ALTER TABLE ADDR DROP COLUMN TELNET;
   DESC ADDR;
   
   --3-4) ���̺��� ���̺� ���� / DML - TRUNCATE TABLE ���̺��
   --   DML - DELETE FROM ���̺�� ����
   TRUNCATE TABLE MAN;
   SELECT * FROM MAN;
   --4. ������ ���۾� DML : ����,����,����,����
   --4-2) INSERT: INSERT INTO ���̺�� VALUES(��,..., ...);
   INSERT INTO PERSON VALUES(1, 'ȫ�浿', 185.0);
   INSERT INTO PERSON VALUES(2, '�̱浿', 180.0);
   INSERT INTO PERSON VALUES(3, '��浿', 178.0);
   INSERT INTO PERSON VALUES(4, '���浿', 169.0);
   
   INSERT INTO PERSON VALUES(6, 167,7); --ERROR ������ ������ �ݵ�� �÷�ǥ��
   INSERT INTO PERSON(bunho, ki) VALUES(6, 167.7);
   INSERT INTO PERSON(bunho, name, ki) VALUES(7, '�����', 177.5); --������ �ִ� ��� �÷�ǥ�� ��������
   SELECT * FROM PERSON;
   --UPDATE PERSON SET NAME='' WHERE KI=167.7;
   --4-3) UPDATE:
   CREATE TABLE MAN(
    NUM NUMBER(3),
    NAME VARCHAR2(15),
    PHONE VARCHAR2(15),
    JUMIN VARCHAR2(20),
    CITY VARCHAR2(15),
    BIRTHDAY DATE       --TIMESTAMP
   );
   
   INSERT INTO MAN
   VALUES
   (1, 'ȫ�浿', '010-123-1234', '123456-1234567', '����', 
   TO_DATE('1980-12-25', 'YYYY-MM-DD'));
   
   INSERT INTO MAN
   VALUES
   (2, '��浿', '010-123-5678', '123456-2234567', '����', 
   TO_DATE('1987-12-25', 'YYYY-MM-DD'));
   
   INSERT INTO MAN
   VALUES
   (3, '�ڱ浿', '010-123-6678', '123456-2334567', '��õ', 
   TO_DATE('1992-01-25', 'YYYY-MM-DD'));
   
   SELECT * FROM MAN;
   
   UPDATE MAN SET CITY='���ֵ�' WHERE NUM=2;
   UPDATE MAN SET CITY='����' WHERE NUM=1;
   UPDATE MAN SET CITY='��õ', NAME='���浿' WHERE NUM=3;
   --4-4) DELETE: DELETE FROM ���̺�� WHERE ������, DDL - TRUNCATE TABLE MAN�� ����
   DELETE FROM MAN WHERE NUM=1;
   TRUNCATE TABLE MAN;
   
   SELECT * FROM PERSON;
   
   
   --5.���̺� ����
   --5-1) ���̺� ������ ���ڵ� ����
   CREATE TABLE COPY_PERSON
   AS SELECT * FROM PERSON
   WHERE 1=2; -- ������ ����̹Ƿ� ���ڵ尡 ���� �ʰ� ������(�ʵ常)�������
   
   DROP TABLE COPY_PERSON;
   
   --6.��������(Constraint)
   --6-1) ������ ��������
   --6-2) Ű��������
   --6-3) ���Ἲ ��������
   
   --6-4) �������� ����
   -- 1) NOT NULL : �ش� �÷� ������ NULL�� ������� ����
   -- 2) UNIQUE : ���̺� ������ �ش� �÷� ���� �׻� ���Ϲ���(�ߺ�X)�� ��, NULL ���
   -- 3) PRIMARY KEY : �ش� �÷� ������ �ݵ�� �����ؾ���, �����ؾ��� (NOT NULL + UNIQUE) ���ϼ��� �ּҼ��� ���ÿ� �����ؾ���
   
   SELECT * FROM COPY_PERSON;
   
   CREATE TABLE TEST(
        ONE NUMBER(2) CONSTRAINT N_ONE NOT NULL,
        TWO NUMBER(2) CONSTRAINT UK_TWO UNIQUE, --�� �����Ǹ鼭 �ߺ��� ��� �ȵ�?
        THREE NUMBER(2) CONSTRAINT PK_THREE PRIMARY KEY -- �⺻Ű�� �⺻������ �ΰ��� ������� ���� (NOT NULL + UNIQUE)
   );
   
   SELECT * FROM TEST;
   
   SELECT * FROM TAB;
   
   INSERT INTO TEST VALUES(1, 10, 55);
   INSERT INTO TEST VALUES(2, 20, 66);

   INSERT INTO TEST VALUES(3, 20, 76); -- 2��° �ʵ尡 �ߺ��� ����� ���� �ʴ´�.
   INSERT INTO TEST VALUES('', 21, 66); --1��° �ʵ尡 �ΰ��� ������� �ʴ´�.
   INSERT INTO TEST(two,three) VALUES(21, 66); --��������
   INSERT INTO TEST(one,three) VALUES(4, 88);
   INSERT INTO TEST(one,twe) VALUES(1,2); -- �⺻Ű�� �⺻������ �ΰ��� ������� ����
   
   INSERT INTO TEST VALUES(6, 12, 99);

   SELECT * FROM TEST;
   
   --4) CHECK : �� �������� ������ ���� �Է��� ���
    CREATE TABLE apple(
        bunho NUMBER(3), 
        age NUMBER(3),
        gender NUMBER(1),
        
        CONSTRAINT pk_bunho PRIMARY KEY(bunho), --� �ʵ��� ������ �ɾ��ִ��� �˾Ƴ������� (bunho)
        CONSTRAINT ch_age CHECK(age BETWEEN 1 AND 120),
        CONSTRAINT ch_gender CHECK(gender IN(1,2)) --CHECK ������ ������ �������ش�
    );
    SELECT * FROM apple;
    DELETE FROM apple WHERE BUNHO = 150;
    INSERT INTO apple VALUES(1,25,1); -- check constraint (JAVA.CH_AGE)
    INSERT INTO apple VALUES(2,150,1); 
    INSERT INTO apple VALUES(3,55,5); --check constraint (JAVA.CH_GENDER)
    
    -- 5)FOREIGN KEY : �ش� �÷��� ���� �ٸ� ���̺��� �÷� ���� ����
    --                  �÷��� ���� ���� �Է����� ����
    CREATE TABLE student(
        stu_no CHAR(9),
        stu_name VARCHAR2(12),
        stu_dept VARCHAR2(20),
        stu_grade NUMBER(1),
        stu_class CHAR(1),
        stu_gender CHAR(1),
        stu_height NUMBER(5,2),
        stu_weight NUMBER(5,2),
        
        CONSTRAINT pk_stu_no PRIMARY KEY(stu_no)
    );
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
    
    --�������̺�
   CREATE TABLE subject(
        sub_no CHAR(3),                         -- �����ȣ
        sub_name VARCHAR2(30),             -- �����̸� 
        sub_prof VARCHAR2(12),              -- ������
        sub_grade NUMBER(1),                -- �г�
        sub_dept VARCHAR2(20),              -- �а�
        CONSTRAINT pk_sub_no PRIMARY KEY(sub_no)
    );
    
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
    
    --�������̺�
    CREATE TABLE enrol(
        sub_no CHAR(3),
        stu_no CHAR(9),
        enr_grade NUMBER(3),
        CONSTRAINT fk_stu_no FOREIGN KEY(stu_no) REFERENCES student(stu_no),
        CONSTRAINT fk_sub_no FOREIGN KEY(sub_no) REFERENCES subject(sub_no)
    );
    
    DROP TABLE ENROL;
    
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
    DROP TABLE ENROL;
     
    SELECT * FROM STUDENT S, SUBJECT J, ENROL E
    WHERE S.STU_NO=E.STU_NO
    AND E.SUB_NO=J.SUB_NO;
    
    --6) ��Ȱ��/Ȱ��, ����/�߰�
    DELETE FROM SUBJECT WHERE SUB_NO='108'; -- ���ε��ֱ� ������ �����ȵ� (�⺻Ű���ִ� ���ڵ尡 �����ϰ��ִ� �ٸ� ���̺��� ���ڵ尡 �ְ�, ����Ǿ� �ִٸ� �������ȵ�)
    
    -- ��Ȱ��
    ALTER TABLE ENROL DISABLE CONSTRAINT FK_SUB_NO CASCADE;
    
    -- ����(������Ʈ����)
    DELETE FROM SUBJECT WHERE SUB_NO='108'; 
    
     --�ٽ� ����
    INSERT INTO subject VALUES('108', '����Ʈ�������', '�ǹμ�', 1, '��ǻ������');
    -- Ȱ��ȭ    
    ALTER TABLE ENROL ENABLE CONSTRAINT FK_SUB_NO;
    
    -- �ٽ� ����
    DELETE FROM SUBJECT WHERE SUB_NO='108'; --�Ұ���
    
    SELECT * FROM ENROL;
    
    -- �������� ����
    ALTER TABLE ENROL DROP CONSTRAINT fk_sub_no CASCADE; -- FOREIGN KEY���� ���ư�
    DELETE FROM SUBJECT WHERE SUB_NO='108';
    
    --�߰�
    INSERT INTO subject VALUES('108', '����Ʈ�������', '�ǹμ�', 1, '��ǻ������');
    
    ALTER TABLE ENROL ADD CONSTRAINT fk_sub_no
    FOREIGN KEY(sub_no) REFERENCES subject(sub_no); --�������� �߰�
    
    DELETE FROM SUBJECT WHERE SUB_NO='108'; --�Ұ�

    --7. DML - SUBQUERY ��
    SELECT * FROM ENROL WHERE STU_NO LIKE '2015%';
    
    --2015�й� �л����� ���������� ���ο� COPY_ENROL ���̺� ������ ����
    CREATE TABLE COPY_ENROL -- CREATE�� AS SELECT
    AS SELECT * FROM ENROL
    WHERE 1=2;
    SELECT * FROM COPY_ENROL;
    
    INSERT INTO COPY_ENROL SELECT * FROM ENROL WHERE STU_NO LIKE '2015%'; -- INSERT�� �׳� SELECT
    
    SELECT * FROM COPY_ENROL;
    SELECT * FROM SUBJECT;
    SELECT * FROM ENROL;
    
    --SUBQUERY, JOIN�� SELECT�Ӹ��ƴ϶� INSERT UPDATE DELETE�� ��� ��� �����մϴ�
    
    --�������ڽ��� �������� 10 ���� ���Ѷ� (SUB_NO=103, ENR_GRADE=45)
    UPDATE COPY_ENROL SET ENR_GRADE = ENR_GRADE + 10
    WHERE SUB_NO = (SELECT SUB_NO FROM SUBJECT WHERE SUB_NAME='�������ڽ���');
    
    --SEQUENCE ����
    --SEQUENCE ����
    --DDL : TALBE, SEQUENCE, VIEW
    CREATE TABLE MSG(
    NUM NUMBER(2),
    MESSAGE VARCHAR2(50),
    CONSTRAINT PK_NUM PRIMARY KEY(NUM)
    );
    --8.SEQUENCE 
    --SEQUENCE ���� (�Խù����鶧 ��ȣ �ڵ�����)
    CREATE SEQUENCE MSG_NUM_SEQ --�����Ϸù�ȣ, ���̺�_�÷���_�������ĺ���
    START WITH 10               --���۹�ȣ
    INCREMENT BY 5              --����
    MAXVALUE 5000;              --�ִ밪
    
    --SEQEUENCE ����
    INSERT INTO MSG VALUES(MSG_NUM_SEQ.NEXTVAL, '�ȳ��ϼ���'); --.NEXTVAL=������ȣ
    INSERT INTO MSG VALUES(MSG_NUM_SEQ.NEXTVAL, 'hi');
    
    SELECT * FROM MSG;
    
    DROP SEQUENCE MSG_NUM_SEQ;
    
    --9. TRANSACTION : �ϳ��� �۾��� Ʈ������̶�� �Ѵ�.
    CREATE TABLE SUNGJUK(
        BUN NUMBER(2),
        IRUM VARCHAR2(20),
        KOR NUMBER(3),
        ENG NUMBER(3),
        MAT NUMBER(3),
        TOT NUMBER(3) DEFAULT 0,
        AVG NUMBER(5,2)
        CONSTRAINT PK_BUN PRIMARY KEY(BUN)
    );
    --AVG�� ����Ʈ������ �ٲٷ��� �����ؾߵ���?   
    
    CREATE SEQUENCE SUNGJUK_BUN_SEQ;
    
    INSERT INTO SUNGJUK(BUN, IRUM, KOR, ENG, MAT)
    VALUES(SUNGJUK_BUN_SEQ.NEXTVAL, '������', 90, 80, 70); -- ��ȣ�� NEXTVAL�� �ڵ�����
    
    INSERT INTO SUNGJUK(BUN, IRUM, KOR, ENG, MAT)
    VALUES(SUNGJUK_BUN_SEQ.NEXTVAL, '����', 90, 80, 70);
    
    INSERT INTO SUNGJUK(BUN, IRUM, KOR, ENG, MAT)
    VALUES(SUNGJUK_BUN_SEQ.NEXTVAL, '������', 90, 80, 70);
    
    INSERT INTO SUNGJUK(BUN, IRUM, KOR, ENG, MAT)
    VALUES(SUNGJUK_BUN_SEQ.NEXTVAL, '����ȭ', 90, 80, 70);
        
    UPDATE SUNGJUK SET TOT=KOR+ENG+MAT; --�ѹ��� ��� ���ڵ� ������Ʈ
    UPDATE SUNGJUK SET AVG=TOT/3;
    
    SELECT * FROM SUNGJUK;
        
    --select�� commit rollback �ʿ���� -->���̺��� ��ȭ�� ���� ���� �����͸� �ѷ��ִ°Ŵϱ�
    
    --insert, update, delete�� �ʿ��� (�� ȯ�漳������ �ڵ�Ŀ�� üũ�ؼ� ���� �����൵ ��)
    
    --9-1) COMMIT : �ϳ��� Ʈ����� ������ �����Ѵ�.
    DELETE FROM SUNGJUK WHERE BUN=1;
    COMMIT;
    --9-2) ROLLBACK : ���� ���·� ���ư� (���)
    UPDATE SUNGJUK SET TOT=KOR+ENG+MAT WHERE BUN=7;
    ROLLBACK;   `
    --9-3) SAVEPOINT : �߰��ܰ�� �ǵ�����
    UPDATE SUNGJUK SET TOT=KOR+ENG+MAT WHERE BUN=6;
    SAVEPOINT S;
    UPDATE SUNGJUK SET AVG=TOT/3 WHERE BUN=6;
    SELECT * FROM SUNGJUK;
    ROLLBACK TO S; -- BUN=6�� AVG���� �ǵ���
    COMMIT;
    --��������: db�����? RDBMS������?  Ʈ������غô�? �ϳ��� �۾��帧�� ������ Ŀ�����ְ� ��ҽÿ��� �ѹ����ִ°� / �������غô�,
    --            �ʹ�����?
    
    --10.INDEX
    SELECT * FROM PERSON;
    
    CREATE TABLE COPY_PERSON
    AS SELECT * FROM PERSON;
    
    SELECT * FROM COPY_PERSON;
    
    INSERT INTO COPY_PERSON SELECT * FROM PERSON;
    INSERT INTO COPY_PERSON SELECT * FROM PERSON;
    INSERT INTO COPY_PERSON SELECT * FROM PERSON;
    INSERT INTO COPY_PERSON SELECT * FROM PERSON;
    INSERT INTO COPY_PERSON SELECT * FROM PERSON;
    INSERT INTO COPY_PERSON SELECT * FROM PERSON;
    INSERT INTO COPY_PERSON SELECT * FROM PERSON;
    
    INSERT INTO COPY_PERSON VALUES(999,'PENGSU',210);
    SELECT * FROM COPY_PERSON WHERE NAME='PENGSU';
    
    --������ ����� �ϵ忡 ����ǰ�, �����(WHERE ���ǿ� ����) RAM�� X,Y�� �Ҵ�ǰ� CPU���� ������ ó���Ѵ� / ������ ������ RAM���� �޸� ������� ����
    --����, �����Ͱ� ���� ���̺��� ���, �Ѳ����� �޸𸮰����� �ö󰡸� �ӵ��� �������ϱ� // ���ϴ� �ʵ常 �ε����� ���༭, RAM�� �ö󰡰� ����� �Ѵ�.
    
    --�ε���(C���� �����ϴ� ����)
    -- 1�ʵ�� 1���� ������ ���� �����
    -- ����:�ӵ��������� ����:�޸� ������ ��ũ��(�����Ͷ�����)
    -- PRIMARY KEY�� �ڵ� �ε����� �� (NULL,�ߺ�X // ���������� �ε����� ����)
    --[�ʵ�] [������(�ּ�)=�ε������̺�]
    -- ��1   2398DFD#@r
    -- ��2   349F$fdfGJI
    -- ��3   AKLSDF@#dfsd
    -- ..   23$90DJdfads
    
    --�ּҰ�
    SELECT ROWID FROM COPY_PERSON;
    -- 10. INDEX : �����ͺ��̽� ���̺� �ִ� �����͸� ���� ã�� ���� �뵵�� ���� �����
    --             ��� ���� �� ���� �ʰ� ���ϴ� �����Ͱ� �ִ� �ּҸ� ã�Ƴ��� �� ����
    --             �޸𸮿� �����ؿ��� ���� �۾��� �����ϴ�.
    SELECT * FROM PERSON;
    
    CREATE TABLE COPY_PERSON
    AS SELECT * FROM PERSON;
    
    
    SELECT COUNT(*) FROM COPY_PERSON;
    INSERT INTO COPY_PERSON VALUES(
    SELECT * FROM COPY_PERSON WHERE NAME='PENGSU';
    
    --10-1)�ε��� ���� / CREATE INDEX �ε����� ON ���̺��(�ʵ��, ... ,...)
    CREATE INDEX INDEX_NAME ON COPY_PERSON(NAME);
    SELECT * FROM COPY_PERSON WHERE NAME = 'PENGSU';
    
    --10-2)�ε��� ���� / DROP INDEX �ε�����
    DROP INDEX INDEX_NAME;
    
    --11.ROWNUM : ������ �Ϸù�ȣ (���������� �ο���) // ���ڵ帶�� ��ȣ�� ������� �ο�
    SELECT ROWNUM, BUNHO, NAME FROM COPY_PERSON;
    
    --5���� ������ ���
    SELECT * FROM SUNGJUK;
    
    SELECT ROWNUM "RNUM" , BUN, IRUM, TOT 
    FROM SUNGJUK
    WHERE ROWNUM BETWEEN 1 AND 4; --�Խ��ǿ��� �������� ��� �Խù����� ���Ҷ� ������
    
    DELETE FROM SUNGJUK WHERE BUN = 7;
    
    INSERT INTO SUNGJUK VALUES('ȫ�浿', 80, 50, 99);
    
    SELECT ROWNUM RNUM, BUN, IRUM, TOT FROM SUNGJUK -- FROM -> WHERE(RNUM�� �������°Ŷ� ����)->�״��� SELECT�� �Ѹ�
    WHERE RNUM >= 1 AND RNUM <= 5;                  -- �Ѹ����� ���� RNUM�� ������ �� ���� --> INLINEVIEW�� �ذ�
    
        
    --ROWNUM ���� ������(�켱����)�� ����ǹǷ� ERROR
    
    SELECT A.RNUM, --3. �ѷ��ش�
            A.BUN,
            A.IRUM,
            A.TOT
    FROM (SELECT ROWNUM RNUM, BUN, IRUM, TOT FROM SUNGJUK) A -- 1.FROM���� ���� ROWNUM�� �����������)
    WHERE A.RNUM >=1 AND A.RNUM <=5; -- 2. ������ �̾Ƴ���
    
    SELECT ROWNUM RNUM, BUN, IRUM, KOR, ENG, MAT, TOT, AVG FROM SUNGJUK;
    
    --SELECT ROWNUM, * FROM SUNGJUK; -- ERROR: �Ұ�
    
    SELECT ROWNUM RNUM, A.* --2. �ٻѷ��ش�
    FROM (SELECT * FROM SUNGJUK) A; -- 1. A��� ������������ �����ͼ�
     
    SELECT * FROM  (SELECT ROWNUM RNUM, A.*
                    FROM (SELECT * FROM SUNGJUK ORDER BY AVG DESC) A) B
    WHERE B.RNUM >=1 AND B.RNUM <= 3;
    
     INSERT INTO SUNGJUK(BUN, IRUM, KOR, ENG, MAT)
     VALUES(SUNGJUK_BUN_SEQ.NEXTVAL, '����2��', 100, 98, 100);
    
    SELECT * FROM SUNGJUK;
    --�信�ٰ� ���־��� �����͸� �����ص� (�� ������ ���Ѽ��� �ʿ�)
    --���ν��� : �Լ�Ÿ������ �Ű������� ���� �� �ִ�.
    
    --12.VIEW : ���� ����ϴ� DML�� �ؽ�Ʈ ���·� ������ ���´�.
    --12-1) �� ���� 
    CREATE VIEW V_PERSON
    AS SELECT NAME FROM PERSON WHERE NAME='ȫ�浿';
    --12-2) �� ����
    SELECT * FROM V_PERSON;
    --12-3) �� ����(OR REPLACE): ���� ��� �״�� �����ϸ鼭 ���븸 ����
    CREATE VIEW V_PERSON
    AS
    SELECT NAME, KI FROM PERSON WHERE NAME ='ȫ�浿';
    
    CREATE OR REPLACE VIEW V_NAME_PERSON
    AS
    SELECT NAME, KI FROM PERSON WHERE NAME ='ȫ�浿';
    
    SELECT * FROM V_NAME_PERSON;
    --12-4) �� ����
    DROP VIEW V_PERSON;
    DROP VIEW V_NAME_PERSON;
        
    --12-5) ���뿹��
    --����� ����ϴ� VIEW (SELECT ��)
    CREATE OR REPLACE VIEW view_enrol
    AS
    SELECT S.STU_NO, SUB_NAME, STU_NAME, E.SUB_NO
    FROM STUDENT S, ENROL E, SUBJECT J
    WHERE S.STU_NO = E.STU_NO
    AND E.SUB_NO = J.SUB_NO;
    
    SELECT * FROM VIEW_ENROL;
    
    
    --������ �л��� ������ ���� ���
    SELECT S.STU_NAME, SUB_NAME
    FROM STUDENT S, view_enrol V
    WHERE S.STU_NO = V.STU_NO --���̺�� �䵵 ������ ����
    AND S.STU_NAME='������';
    
    --���� ��ձ��ϱ�

    SELECT AVG(ENR_GRADE),
           SUB_NAME
    FROM ENROL E, VIEW_ENROL V
    WHERE E.SUB_NO = V.SUB_NO
    GROUP BY (SUB_NAME);
    
    
    