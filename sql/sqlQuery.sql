DROP TABLE fh_tb_user;
drop table fh_tb_board_qna;
drop table fh_tb_board_free;
drop table fh_tb_board_notice;
drop table fh_tb_board_guestbook;

drop sequence idx_seq;
drop sequence qna_seq;
drop sequence free_seq;
drop sequence notice_seq;
drop sequence guestbook_seq;

create sequence idx_seq 
  start with 1 
  increment by 1 
  nomaxvalue;
  
create sequence notice_seq 
  start with 1 
  increment by 1 
  nomaxvalue;

create sequence qna_seq 
  start with 1 
  increment by 1 
  nomaxvalue;

create sequence free_seq
  start with 1
  increment by 1
  nomaxvalue
  nocache
  nocycle;
  
create sequence guestbook_seq
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

create table fh_tb_board_qna (
  idx number not null,
  id varchar2(20) not null,
  title varchar2(30) not null,
  content varchar2(50),
  regdate timestamp not null
);

create table fh_tb_board_free (
  idx number not null,
  id varchar2(20) not null,
  title varchar2(30) not null,
  content varchar2(50),
  regdate timestamp not null
);

create table fh_tb_board_notice (
  idx number not null,
  id varchar2(20) not null,
  title varchar2(30) not null,
  content varchar2(50),
  regdate timestamp not null
);

create table fh_tb_board_guestbook (
  idx number not null,
  id varchar2(20) not null,
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

insert into fh_tb_board_qna(idx, id, title, content, regdate) values(qna_seq.nextval,     'id1',    'title0',   'content',    sysdate);
insert into fh_tb_board_qna(idx, id, title, content, regdate) values(qna_seq.nextval,     'id2',    'title1',   'content',    sysdate);
insert into fh_tb_board_qna(idx, id, title, content, regdate) values(qna_seq.nextval,     'id3',    'title2',   'content',    sysdate);
insert into fh_tb_board_qna(idx, id, title, content, regdate) values(qna_seq.nextval,     'id4',    'title3',   'content',    sysdate);
insert into fh_tb_board_qna(idx, id, title, content, regdate) values(qna_seq.nextval,     'id5',    'title4',   'content',    sysdate);
insert into fh_tb_board_qna(idx, id, title, content, regdate) values(qna_seq.nextval,     'id6',    'title5',   'content',    sysdate);
insert into fh_tb_board_qna(idx, id, title, content, regdate) values(qna_seq.nextval,     'id7',    'title6',   'content',    sysdate);
insert into fh_tb_board_qna(idx, id, title, content, regdate) values(qna_seq.nextval,     'id8',    'title7',   'content',    sysdate);
insert into fh_tb_board_qna(idx, id, title, content, regdate) values(qna_seq.nextval,     'id9',    'title8',   'content',    sysdate);
insert into fh_tb_board_qna(idx, id, title, content, regdate) values(qna_seq.nextval,     'id10',   'title9',   'content',    sysdate);

insert into fh_tb_board_notice(idx, id, title, content, regdate) values(notice_seq.nextval,     'id1',    'title0',   'content',    sysdate);
insert into fh_tb_board_notice(idx, id, title, content, regdate) values(notice_seq.nextval,     'id2',    'title1',   'content',    sysdate);
insert into fh_tb_board_notice(idx, id, title, content, regdate) values(notice_seq.nextval,     'id3',    'title2',   'content',    sysdate);
insert into fh_tb_board_notice(idx, id, title, content, regdate) values(notice_seq.nextval,     'id4',    'title3',   'content',    sysdate);
insert into fh_tb_board_notice(idx, id, title, content, regdate) values(notice_seq.nextval,     'id5',    'title4',   'content',    sysdate);
insert into fh_tb_board_notice(idx, id, title, content, regdate) values(notice_seq.nextval,     'id6',    'title5',   'content',    sysdate);
insert into fh_tb_board_notice(idx, id, title, content, regdate) values(notice_seq.nextval,     'id7',    'title6',   'content',    sysdate);
insert into fh_tb_board_notice(idx, id, title, content, regdate) values(notice_seq.nextval,     'id8',    'title7',   'content',    sysdate);
insert into fh_tb_board_notice(idx, id, title, content, regdate) values(notice_seq.nextval,     'id9',    'title8',   'content',    sysdate);
insert into fh_tb_board_notice(idx, id, title, content, regdate) values(notice_seq.nextval,     'id10',   'title9',   'content',    sysdate);

insert into fh_tb_board_free(idx, id, title, content, regdate) values(free_seq.nextval,     'id1',    'title0',   'content',    sysdate);
insert into fh_tb_board_free(idx, id, title, content, regdate) values(free_seq.nextval,     'id2',    'title1',   'content',    sysdate);
insert into fh_tb_board_free(idx, id, title, content, regdate) values(free_seq.nextval,     'id3',    'title2',   'content',    sysdate);
insert into fh_tb_board_free(idx, id, title, content, regdate) values(free_seq.nextval,     'id4',    'title3',   'content',    sysdate);
insert into fh_tb_board_free(idx, id, title, content, regdate) values(free_seq.nextval,     'id5',    'title4',   'content',    sysdate);
insert into fh_tb_board_free(idx, id, title, content, regdate) values(free_seq.nextval,     'id6',    'title5',   'content',    sysdate);
insert into fh_tb_board_free(idx, id, title, content, regdate) values(free_seq.nextval,     'id7',    'title6',   'content',    sysdate);
insert into fh_tb_board_free(idx, id, title, content, regdate) values(free_seq.nextval,     'id8',    'title7',   'content',    sysdate);
insert into fh_tb_board_free(idx, id, title, content, regdate) values(free_seq.nextval,     'id9',    'title8',   'content',    sysdate);
insert into fh_tb_board_free(idx, id, title, content, regdate) values(free_seq.nextval,     'id10',   'title9',   'content',    sysdate);

insert into fh_tb_board_guestbook(idx, id, title, content, regdate) values(guestbook_seq.nextval,     'id1',    'title0',   'content',    sysdate);
insert into fh_tb_board_guestbook(idx, id, title, content, regdate) values(guestbook_seq.nextval,     'id2',    'title1',   'content',    sysdate);
insert into fh_tb_board_guestbook(idx, id, title, content, regdate) values(guestbook_seq.nextval,     'id3',    'title2',   'content',    sysdate);
insert into fh_tb_board_guestbook(idx, id, title, content, regdate) values(guestbook_seq.nextval,     'id4',    'title3',   'content',    sysdate);
insert into fh_tb_board_guestbook(idx, id, title, content, regdate) values(guestbook_seq.nextval,     'id5',    'title4',   'content',    sysdate);
insert into fh_tb_board_guestbook(idx, id, title, content, regdate) values(guestbook_seq.nextval,     'id6',    'title5',   'content',    sysdate);
insert into fh_tb_board_guestbook(idx, id, title, content, regdate) values(guestbook_seq.nextval,     'id7',    'title6',   'content',    sysdate);
insert into fh_tb_board_guestbook(idx, id, title, content, regdate) values(guestbook_seq.nextval,     'id8',    'title7',   'content',    sysdate);
insert into fh_tb_board_guestbook(idx, id, title, content, regdate) values(guestbook_seq.nextval,     'id9',    'title8',   'content',    sysdate);
insert into fh_tb_board_guestbook(idx, id, title, content, regdate) values(guestbook_seq.nextval,     'id10',   'title9',   'content',    sysdate);

