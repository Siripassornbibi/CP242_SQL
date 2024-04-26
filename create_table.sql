CREATE TABLE DEPARTMENT (
    DEPARTMENT_ID NUMBER(4) NOT NULL ENABLE,
    DEPARTMENT_NAME VARCHAR2(300) NOT NULL ENABLE,
    PRIMARY KEY (DEPARTMENT_ID) USING INDEX ENABLE
);


CREATE TABLE FACULTY (
    FACULTY_ID NUMBER(4) NOT NULL ENABLE,
    FACULTY_NAME VARCHAR2(300) NOT NULL ENABLE,
    PRIMARY KEY (FACULTY_ID) USING INDEX ENABLE
);


CREATE TABLE COURSE (
    COURSE_ID NUMBER(4) NOT NULL ENABLE,
    DEPARTMENT_ID NUMBER(4) NOT NULL ENABLE,
    FACULTY_ID NUMBER(4) NOT NULL ENABLE,
    PRIMARY KEY (COURSE_ID) USING INDEX ENABLE
);

ALTER TABLE COURSE ADD CONSTRAINT COURSE_FK_DEP FOREIGN KEY (DEPARTMENT_ID)
    REFERENCES DEPARTMENT (DEPARTMENT_ID)  ON DELETE CASCADE ENABLE;
ALTER TABLE COURSE ADD CONSTRAINT COURSE_FK_FAC FOREIGN KEY (FACULTY_ID)
    REFERENCES FACULTY (FACULTY_ID)  ON DELETE CASCADE ENABLE;


CREATE TABLE SUBJECT (
    SUBJECT_ID VARCHAR2(10) NOT NULL ENABLE,
    SUBJECT_NAME VARCHAR2(300) NOT NULL ENABLE,
    SUBJECT_MAIN VARCHAR2(10),
    CONSTRAINT SUBJECT_PK PRIMARY KEY (SUBJECT_ID) USING INDEX ENABLE
);

ALTER TABLE "SUBJECT" ADD CONSTRAINT SUBJECT_FK FOREIGN KEY (SUBJECT_MAIN)
    REFERENCES "SUBJECT" (SUBJECT_ID)  ON DELETE CASCADE ENABLE;


CREATE TABLE UNIVERSITY (
    UNI_ID VARCHAR(10),
    UNI_NAME VARCHAR2(300) NOT NULL ENABLE,
    PRIMARY KEY (UNI_ID) USING INDEX ENABLE
);


CREATE TABLE APPLICANT_STAT
   (YEAR VARCHAR2(4) NOT NULL ENABLE, 
	ATTENDANT NUMBER NOT NULL ENABLE, 
	NEW_APPLICANT NUMBER NOT NULL ENABLE, 
	OLD_APPLICANT NUMBER NOT NULL ENABLE, 
    FEMALE NUMBER NOT NULL ENABLE, 
	MALE NUMBER NOT NULL ENABLE, 
    PAPER NUMBER NOT NULL ENABLE,
    COMP NUMBER NOT NULL ENABLE,
	CONSTRAINT APPLICANT_STAT_PK PRIMARY KEY (YEAR) USING INDEX ENABLE
);


CREATE TABLE "SUBJECT_STAT" (	
    "YEAR" VARCHAR2(4) NOT NULL ENABLE, 
	"SUBJECT_ID" VARCHAR(10) NOT NULL ENABLE, 
	"TOTAL_SCORE" NUMBER(7,4) NOT NULL ENABLE, 
	"ATTENDANT" NUMBER NOT NULL ENABLE, 
    "FEMALE" NUMBER,
    "MALE" NUMBER,
    "NEW_APPLICANT" NUMBER,
    "OLD_APPLICANT" NUMBER,
	"MEAN" NUMBER(7,4) NOT NULL ENABLE, 
	"SD" NUMBER(7,4) NOT NULL ENABLE, 
	"MIN" NUMBER(7,4) NOT NULL ENABLE, 
	"MAX" NUMBER(7,4) NOT NULL ENABLE, 
	"MEDIAN" NUMBER(7,4) NOT NULL ENABLE, 
	"MODE" NUMBER(7,4) NOT NULL ENABLE, 
	CONSTRAINT "PK_SUBJECT_STAT" PRIMARY KEY ("YEAR", "SUBJECT_ID") USING INDEX ENABLE
);

 ALTER TABLE "SUBJECT_STAT" ADD CONSTRAINT "FK_SUBJECT_STAT" FOREIGN KEY ("SUBJECT_ID")
	  REFERENCES "SUBJECT" ("SUBJECT_ID") ENABLE;


CREATE TABLE UNIVERSITY_STAT (
    YEAR VARCHAR2(4) NOT NULL ENABLE,
    UNI_ID VARCHAR(10) NOT NULL ENABLE,
    COURSE_ID NUMBER(4) NOT NULL ENABLE,
    MIN NUMBER(7,4) NOT NULL ENABLE,
    MAX NUMBER(7,4) NOT NULL ENABLE,
    NUM_ACCEPT NUMBER NOT NULL ENABLE,
    NUM_REGISTER NUMBER NOT NULL ENABLE,
    NUM_PASS NUMBER NOT NULL ENABLE,
    CONSTRAINT PK_UNIVERSITY_STAT PRIMARY KEY (YEAR, UNI_ID, COURSE_ID) USING INDEX ENABLE
);

ALTER TABLE UNIVERSITY_STAT ADD CONSTRAINT FK_UNIVERSITY_STAT_UNIVERSITY FOREIGN KEY (UNI_ID)
    REFERENCES UNIVERSITY (UNI_ID)  ON DELETE CASCADE ENABLE;

ALTER TABLE UNIVERSITY_STAT ADD CONSTRAINT FK_UNIVERSITY_STAT_COURSE FOREIGN KEY (COURSE_ID)
    REFERENCES COURSE (COURSE_ID)  ON DELETE CASCADE ENABLE;


CREATE TABLE STATISTIC (
    YEAR VARCHAR2(4) NOT NULL ENABLE,
    UNI_ID VARCHAR(10) NOT NULL ENABLE,
    COURSE_ID NUMBER(4) NOT NULL ENABLE,
    SUBJECT_ID VARCHAR(10) NOT NULL ENABLE,
    CONSTRAINT STATISTIC_CON_P PRIMARY KEY (YEAR, UNI_ID, COURSE_ID, SUBJECT_ID) USING INDEX ENABLE
);

ALTER TABLE STATISTIC ADD CONSTRAINT STATISTIC_CON FOREIGN KEY (YEAR, SUBJECT_ID)
    REFERENCES SUBJECT_STAT (YEAR, SUBJECT_ID)  ON DELETE CASCADE ENABLE;

ALTER TABLE STATISTIC ADD CONSTRAINT STATISTIC_CON2 FOREIGN KEY (YEAR, UNI_ID, COURSE_ID)
    REFERENCES UNIVERSITY_STAT (YEAR, UNI_ID, COURSE_ID)  ON DELETE CASCADE ENABLE;

ALTER TABLE STATISTIC ADD CONSTRAINT STATISTIC_CON3 FOREIGN KEY (YEAR)
    REFERENCES APPLICANT_STAT (YEAR)  ON DELETE CASCADE ENABLE;


