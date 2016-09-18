DROP TABLE FH_TB_USER;
DROP SEQUENCE FH_SEQUENCE;
DROP TRIGGER FH_SEQUENCE_TRIGGER;

CREATE TABLE FH_TB_USER (
idx NUMBER NOT NULL PRIMARY KEY,
name VARCHAR2(50),
gender VARCHAR2(2),
phone VARCHAR2(50),
email VARCHAR2(50),
grade NUMBER
);

CREATE SEQUENCE FH_SEQUENCE START WITH 1 INCREMENT BY 1 MAXVALUE 9999999999;

CREATE OR REPLACE TRIGGER FH_SEQUENCE_TRIGGER
  BEFORE INSERT ON FH_TB_USER
  FOR EACH ROW
BEGIN
  :new.idx := FH_SEQUENCE.nextval;
END;

INSERT INTO FH_TB_USER(name, sex, phone, email, grade) values('chandler', 'm', '01012341234', 'chandler4470@gmail.com', 99);
INSERT INTO FH_TB_USER(name, sex, phone, email, grade) values('seokrae', 'm', '98761234', 'seok@gmail.com', 99);
INSERT INTO FH_TB_USER(name, sex, phone, email, grade) values('simi', 'm', '0181234', 'simi@hanmail.net', 99);
INSERT INTO FH_TB_USER(name, sex, phone, email, grade) values('mj', 'm', '0171234', 'mj@github.com', 99);

