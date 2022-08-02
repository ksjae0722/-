/*create*/
create database pro5_lms;

/*1 : 학과테이블*/
create table department(
d_name varchar(10) not null,
d_code char(3) not null,
primary key(d_name)
);

/*2 : 교직원테이블*/
create table personal(
p_id char(8) not null,
p_name varchar(10) not null,
p_regNumber1 char(6) not null,
p_regNumber2 char(7) not null,
p_passwd varchar(20),
p_college varchar(10) not null,
p_department varchar(10) not null,
p_major varchar(10)not null,
p_office varchar(100) not null,
p_oNumber varchar(13) not null,
p_email varchar(50) not null,
primary key(p_id)
);

/*3 : 학사일정테이블*/
create table calendar(
cal_num int not null auto_increment,
cal_date1 date not null,
cal_date2 date,
cal_contents text not null,
primary key(cal_num)
);

/*4 : 학생테이블*/
create table student(
s_id int not null,
s_name varchar(10) not null,
s_regNumber1 char(6) not null,
s_regNumber2 char(7) not null,
s_passwd varchar(20),
s_college varchar(10) not null,
d_name varchar(10) not null,
s_score decimal(3,2),
s_state varchar(5) not null,
s_grade int not null,
s_address varchar(100),
s_pNumber varchar(13) not null,
s_email varchar(50),
s_account1 varchar(10),
s_account2 varchar(50),
s_account3 varchar(10),
s_max int,
primary key(s_id),
foreign key(d_name) references department(d_name)
);

/*5 : 과목테이블*/
create table ssubject(
sub_name varchar(10) not null,
sub_code char(5) not null,
sub_isu varchar(10)not null,
sub_hakjum int not null,
p_name varchar(10) not null,
p_id char(8) not null,
sub_day varchar(5) not null,
sub_time varchar(20) not null,
sub_allday int not null,
d_name varchar(10) not null,
sub_room int not null,
sub_classtime varchar(20) not null,
sub_max int not null,
primary key(sub_name),
foreign key(p_id) references personal(p_id),
foreign key(d_name) references department(d_name)
);

/*6 : 문제테이블 1*/
create table exam1(
ex_code int not null auto_increment,
sub_name varchar(10) not null,
ex_num int not null,
ex_contents text not null,
ex_ans int not null,
primary key(ex_code),
foreign key(sub_name) references ssubject(sub_name)
);

/*7 : 문제테이블 2*/
create table exam2(
ex_code2 int not null auto_increment,
sub_name varchar(10) not null,
ex_ans2 char(20) not null,
primary key(ex_code2),
foreign key(sub_name) references ssubject(sub_name)
);

/*8 : 답안지테이블*/
create table answer(
ans_code int not null auto_increment,
ans_answer char(20) not null,
sub_name varchar(10) not null,
s_id int not null,
primary key(ans_code),
foreign key(sub_name) references ssubject(sub_name),
foreign key(s_id) references student(s_id)
);

/*9 : 공지사항테이블*/
create table notice(
n_num int not null auto_increment,
n_subject text not null,
n_date date not null,
p_department varchar(10) not null,
p_oNumber varchar(13) not null,
n_filename varchar(30),
n_realname varchar(30),
n_contents text not null,
p_name varchar(10) not null,
p_id char(8) not null,
primary key(n_num),
foreign key(p_id) references personal(p_id)
);

/*10 : 과목별게시판테이블*/
create table post(
po_num int not null auto_increment,
po_subject text not null,
po_date date not null,
sub_name varchar(10) not null,
p_oNumber varchar(13) not null,
n_contents text not null,
p_name varchar(10) not null,
p_id char(8) not null,
po_filename varchar(30),
po_realname varchar(30),
primary key(po_num),
foreign key(sub_name) references ssubject(sub_name),
foreign key(p_id) references personal(p_id)
);

/*11 : 수강신청테이블*/
create table application(
app_num int not null auto_increment,
s_id int not null,
sub_name varchar(10) not null,
sub_code char(5) not null,
primary key(app_num),
foreign key(s_id) references student(s_id),
foreign key(sub_name) references ssubject(sub_name)
);

/*12 : 강의테이블*/				
create table lecture(				
	lec_num	int	not null auto_increment,	
	s_id int not null,			
	sub_name varchar(10) not null,			
	lec_score varchar(2) not null,			
	lec_no_date	int	not null default 0,	
	lec_year int not null,			
	lec_semester int not null,			
primary key(lec_num),				
foreign key(s_id) references student(s_id),				
foreign key(sub_name) references ssubject(sub_name)				
);				