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
'15.5cm 전면 화면 OLED 디스플레이, 2556*1179 픽셀 해상도', 'Phone', 'Apple'
,1000, '신제품', 'P0001.png');

insert into product values('P0002', 'LG PC 그램', 1200000, 
'13.3인치, IPS LED 디스플리에, 인텔 코어 프로세스, 2556*1179 픽셀 해상도', 'Notebook', 'LG'
,1000, '재생품', 'P0002.png');

insert into product values('P0003', 'Galaxy Tab S8', 400000, 
'2560*1600 픽셀 해상도', 'Tablet', 'Samsung'
,1000, '중고품', 'P0003.png');

select * from product;