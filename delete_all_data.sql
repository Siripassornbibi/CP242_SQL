ALTER TABLE COURSE DROP CONSTRAINT COURSE_FK_DEP;
ALTER TABLE COURSE DROP CONSTRAINT COURSE_FK_FAC;
ALTER TABLE "SUBJECT" DROP CONSTRAINT SUBJECT_FK;
ALTER TABLE SUBJECT_STAT DROP CONSTRAINT FK_SUBJECT_STAT;
ALTER TABLE UNIVERSITY_STAT DROP CONSTRAINT FK_UNIVERSITY_STAT_UNIVERSITY;
ALTER TABLE UNIVERSITY_STAT DROP CONSTRAINT FK_UNIVERSITY_STAT_COURSE;
ALTER TABLE STATISTIC DROP CONSTRAINT STATISTIC_CON;
ALTER TABLE STATISTIC DROP CONSTRAINT STATISTIC_CON2;
ALTER TABLE STATISTIC DROP CONSTRAINT STATISTIC_CON3;


TRUNCATE TABLE APPLICANT_STAT;
TRUNCATE TABLE COURSE;
TRUNCATE TABLE STATISTIC;
TRUNCATE TABLE SUBJECT;
TRUNCATE TABLE UNIVERSITY;
TRUNCATE TABLE UNIVERSITY_STAT;
TRUNCATE TABLE SUBJECT_STAT;
TRUNCATE TABLE DEPARTMENT;
TRUNCATE TABLE FACULTY;


DROP SEQUENCE DEPARTMENT_SEQ;
DROP SEQUENCE FACULTY_SEQ;
