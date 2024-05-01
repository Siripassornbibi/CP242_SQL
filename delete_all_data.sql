ALTER TABLE FACULTY DROP CONSTRAINT FACULTY_FK_DEP;
ALTER TABLE FACULTY DROP CONSTRAINT FACULTY_FK_INFO;
ALTER TABLE "SUBJECT" DROP CONSTRAINT SUBJECT_FK;
ALTER TABLE "SUBJECT_STAT" DROP CONSTRAINT "FK_SUBJECT_STAT";
ALTER TABLE UNIVERSITY_STAT DROP CONSTRAINT FK_UNIVERSITY_STAT;
ALTER TABLE STATISTIC DROP CONSTRAINT STATISTIC_CON;
ALTER TABLE STATISTIC DROP CONSTRAINT STATISTIC_CON2;
ALTER TABLE STATISTIC DROP CONSTRAINT STATISTIC_CON3;


TRUNCATE TABLE APPLICANT_STAT;
TRUNCATE TABLE STATISTIC;
TRUNCATE TABLE SUBJECT;
TRUNCATE TABLE UNIVERSITY;
TRUNCATE TABLE UNIVERSITY_INFO;
TRUNCATE TABLE UNIVERSITY_STAT;
TRUNCATE TABLE SUBJECT_STAT;
TRUNCATE TABLE DEPARTMENT;
TRUNCATE TABLE FACULTY;
TRUNCATE TABLE FACULTY_INFO;


DROP SEQUENCE DEPARTMENT_SEQ;
DROP SEQUENCE FACULTY_SEQ;

ALTER TABLE FACULTY ADD CONSTRAINT FACULTY_FK_DEP FOREIGN KEY (DEPARTMENT_ID)
    REFERENCES DEPARTMENT (DEPARTMENT_ID);

ALTER TABLE FACULTY ADD CONSTRAINT FACULTY_FK_INFO FOREIGN KEY (FACULTY_ID)
    REFERENCES FACULTY_INFO (FACULTY_ID);

ALTER TABLE "SUBJECT" ADD CONSTRAINT SUBJECT_FK FOREIGN KEY (SUBJECT_MAIN)
    REFERENCES "SUBJECT" (SUBJECT_ID);

ALTER TABLE "SUBJECT_STAT" ADD CONSTRAINT "FK_SUBJECT_STAT" FOREIGN KEY ("SUBJECT_ID")
	  REFERENCES "SUBJECT" ("SUBJECT_ID") ENABLE;

ALTER TABLE UNIVERSITY_STAT ADD CONSTRAINT FK_UNIVERSITY_STAT FOREIGN KEY (UNI_ID, FACULTY_ID, DEPARTMENT_ID)
    REFERENCES UNIVERSITY (UNI_ID, FACULTY_ID, DEPARTMENT_ID);

ALTER TABLE STATISTIC ADD CONSTRAINT STATISTIC_CON FOREIGN KEY (YEAR, SUBJECT_ID)
    REFERENCES SUBJECT_STAT (YEAR, SUBJECT_ID);

ALTER TABLE STATISTIC ADD CONSTRAINT STATISTIC_CON2 FOREIGN KEY (YEAR, UNI_ID, FACULTY_ID, DEPARTMENT_ID)
    REFERENCES UNIVERSITY_STAT (YEAR, UNI_ID, FACULTY_ID, DEPARTMENT_ID);

ALTER TABLE STATISTIC ADD CONSTRAINT STATISTIC_CON3 FOREIGN KEY (YEAR)
    REFERENCES APPLICANT_STAT (YEAR);

