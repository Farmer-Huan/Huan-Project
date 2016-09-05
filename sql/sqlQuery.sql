DROP TABLE fh_tb_user;
Drop table fh_tb_boardlist;
drop table fh_tb_board;
DROP SEQUENCE idx_seq;
drop sequence board_seq;

create sequence idx_seq 
  start with 1 
  increment by 1 
  nomaxvalue;
  
create sequence board_seq
  start with 1
  increment by 1
  nomaxvalue
  nocache
  nocycle;
  
create table fh_tb_user (
  idx number not null,
  id varchar2(12) not null PRIMARY KEY,
  pwd varchar2(12) not null,
  phone varchar2(20),
  email varchar2(30),
  regdate timestamp not null
);

create table fh_tb_boardlist (
  idx number not null,
  code number not null primary key,
  subject varchar2(50) not null
);

create table fh_tb_board (
  idx number not null,
  id varchar2(20) not null,
  pwd varchar2(20),
  title varchar2(30) not null,
  content varchar2(50),
  regdate timestamp not null
);

insert into fh_tb_user(idx, id, pwd, phone, email, regdate) values(idx_seq.nextval, 'chandler', 'pwd', '01012341234', 'chandler4470@gmail.com', sysdate);
insert into fh_tb_user(idx, id, pwd, phone, email, regdate) values(idx_seq.nextval, 'kslsr',    'pwd', '12312312321', 'kslbsh@gmail.com',       sysdate);
insert into fh_tb_user(idx, id, pwd, phone, email, regdate) values(idx_seq.nextval, 'simi',     'pwd', '67865474855', 'kkk@gmail.com',          sysdate);
insert into fh_tb_user(idx, id, pwd, phone, email, regdate) values(idx_seq.nextval, 'mj',       'pwd', '48867687653', '123332@gmail.com',       sysdate);
insert into fh_tb_user(idx, id, pwd, phone, email, regdate) values(idx_seq.nextval, 'yh',       'pwd', '23444667683', 'qqwewqe@gmail.com',      sysdate);
insert into fh_tb_user(idx, id, pwd, phone, email, regdate) values(idx_seq.nextval, 'tg',       'pwd', '34537486789', 'qwewdds@gmail.com',      sysdate);
insert into fh_tb_user(idx, id, pwd, phone, email, regdate) values(idx_seq.nextval, 'rf',       'pwd', '23287654365', 'sdfasf@gmail.com',       sysdate);
insert into fh_tb_user(idx, id, pwd, phone, email, regdate) values(idx_seq.nextval, 'ed',       'pwd', '01012341234', 'xcvxcv@gmail.com',       sysdate);
insert into fh_tb_user(idx, id, pwd, phone, email, regdate) values(idx_seq.nextval, 'wd',       'pwd', '01012341234', 'yuiu@gmail.com',         sysdate);
