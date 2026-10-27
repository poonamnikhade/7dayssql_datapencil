CREATE DATABASE sql7challenge;
USE sql7challenge;

create table customers
(customer_id int primary key,
full_name varchar(100) not null,
email varchar(90) not null,
city varchar(100)not null,
signup_date date not null,
segment varchar(100) not null);

 -- products 
create table products(
product_id integer primary key,
product_name varchar(100) not null,
category varchar(100) not null,
price decimal(10,2) not null,
cost decimal(10,2)not null
);

-- orders
create table orders(
order_id int primary key,
customer_id int not null,
order_date date not null,
status varchar(100) not null,
channel varchar(100) not null,
foreign key (customer_id) references customers(customer_id)
);

-- orderitem
create table orderitem(
order_item_id int primary key,
order_id int not null,
product_id int not null,
quantity int ,
unit_price decimal(10,2),

foreign key (order_id) references orders(order_id)

);
-- payment
create table payment (
payment_id int primary key,
order_id int not null,
payment_method varchar(100),
payment_status varchar(50) not null,
amount decimal(10,2),

foreign key (order_id) references orders(order_id)

);

-- delivery
create table delivery(
delivery_id int primary key,
order_id int ,
dispatch_date date not null,
delivery_date date not null,
delivery_status varchar(100) not null,

foreign key(order_id) references orders(order_id)
);


