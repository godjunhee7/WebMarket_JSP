create database WebMarketDB;

drop table product;

create table if not exists product(
	p_id varchar(10) not null,
	p_name varchar(100),
	p_unitprice integer,
	p_description text,
	p_category varchar(20),
	p_manufacturer varchar(20),
	p_unitinstock long,
	p_condition varchar(20),
	p_filename varchar(20),
	primary key (p_id)
)default character set=utf8 collate utf8_general_ci;

desc product;


insert into product values('P0001', 'iPhone 14 Pro', 1500000, 
'15.5cm ���� ȭ�� OLED ���÷���, 2556*1179 �ȼ� �ػ�', 'Phone', 'Apple'
,1000, '����ǰ', 'P0001.png');

insert into product values('P0002', 'LG PC �׷�', 1200000, 
'13.3��ġ, IPS LED ���ø���, ���� �ھ� ���μ���, 2556*1179 �ȼ� �ػ�', 'Notebook', 'LG'
,1000, '���ǰ', 'P0002.png');

insert into product values('P0003', 'Galaxy Tab S8', 400000, 
'2560*1600 �ȼ� �ػ�', 'Tablet', 'Samsung'
,1000, '�߰�ǰ', 'P0003.png');

select * from product;