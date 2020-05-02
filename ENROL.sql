--------------------------------------------------------
--  颇老捞 积己凳 - 格夸老-4岿-16-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table ENROL
--------------------------------------------------------

  CREATE TABLE "HR"."ENROL" 
   (	"SUB_NO" CHAR(3 BYTE), 
	"STU_NO" CHAR(9 BYTE), 
	"ENR_GRADE" NUMBER(3,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into HR.ENROL
SET DEFINE OFF;
Insert into HR.ENROL (SUB_NO,STU_NO,ENR_GRADE) values ('101','20131001 ',80);
Insert into HR.ENROL (SUB_NO,STU_NO,ENR_GRADE) values ('104','20131001 ',56);
Insert into HR.ENROL (SUB_NO,STU_NO,ENR_GRADE) values ('106','20132003 ',72);
Insert into HR.ENROL (SUB_NO,STU_NO,ENR_GRADE) values ('103','20152088 ',45);
Insert into HR.ENROL (SUB_NO,STU_NO,ENR_GRADE) values ('101','20131025 ',65);
Insert into HR.ENROL (SUB_NO,STU_NO,ENR_GRADE) values ('104','20131025 ',65);
Insert into HR.ENROL (SUB_NO,STU_NO,ENR_GRADE) values ('108','20151062 ',81);
Insert into HR.ENROL (SUB_NO,STU_NO,ENR_GRADE) values ('107','20143054 ',41);
Insert into HR.ENROL (SUB_NO,STU_NO,ENR_GRADE) values ('102','20153075 ',66);
Insert into HR.ENROL (SUB_NO,STU_NO,ENR_GRADE) values ('105','20153075 ',56);
Insert into HR.ENROL (SUB_NO,STU_NO,ENR_GRADE) values ('102','20153088 ',61);
Insert into HR.ENROL (SUB_NO,STU_NO,ENR_GRADE) values ('105','20153088 ',78);
--------------------------------------------------------
--  DDL for Index P_COURSE
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."P_COURSE" ON "HR"."ENROL" ("SUB_NO", "STU_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table ENROL
--------------------------------------------------------

  ALTER TABLE "HR"."ENROL" ADD CONSTRAINT "P_COURSE" PRIMARY KEY ("SUB_NO", "STU_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
