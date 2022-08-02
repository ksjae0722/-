use pro5_lms;

delete from department;
delete from student where s_id=22001001;
delete from personal where p_id='p2001001';
delete from ssubject where sub_name ='범죄와인권';
delete from post;
delete from application;
delete from application where s_id=22001001 and sub_code='S0036';

select * from application;
select * from ssubject;
select * from department;
select * from student;
select * from personal;
select * from post ORDER BY po_num DESC;
select * from notice;
select * from exam1;
select * from exam2;
select * from answer;
select s_name, s_id from student where s_regNumber1=200101 and s_regNumber2=1111111;
select * from student where s_id=22001001;
select * from application;
select * from lecture;
select * from calendar;

select * from ssubject where sub_name in(select sub_name from application where s_id=22001001);
select count(*) from application where sub_code='S0011' and s_id=22001001;

update student set s_max=0 where s_id=22001001;
update ssubject set sub_max=0 where sub_name='범죄와인권';
update ssubject set sub_max=30 where sub_name='범죄와인권';
update ssubject set sub_classtime='11,12,13' where sub_name='범죄와인권';
insert into post(po_subject, po_date, sub_name, p_oNumber, n_contents, p_name, p_id) value ('a', '2016-01-01', '간호학개론', '01012345816', 'asdf', '박문숙', 'p1103010');

SET foreign_key_checks = 0;
drop table student;
drop table department;
drop table calendar;
drop table post;
SET foreign_key_checks = 1;