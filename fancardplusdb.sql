create database FanCardPlus ;
create schema dbo ; 

--Creating FAQ category table 
create table dbo.FAQ_Category(
    FAQ_Category_id  SERIAL primary key, 
    name varchar(100), 
    description text

);

--Creating FAQ table 
create table dbo.FAQ(
    FAQ_ID serial primary key, 
    FAQ_Category_id int not null, 
    question text, 
    answer text, 
    foreign key (FAQ_category_id) references dbo.FAQ_category(FAQ_category_id) 
    
) ;



--Creating user table 
Create table dbo.user(
     serial primary key, 
    user_name varchar(100) unique, 
    phone_number varchar(15), 
    email varchar(25) unique, 
    address varchar(80), 
    password varchar(100), 
    first_name varchar(50), 
    last_name varchar(50), 
    image_url varchar(80), 
    is_active boolean default FALSE, 
    issued_on DATE DEFAULT current_date,
    NFC_ID int
);

ALTER TABLE dbo.user
ADD COLUMN issued_on DATE DEFAULT current_date;


-- Creating transcation category 
create table dbo.Transaction_category (
    transaction_category_id serial primary key, 
    name varchar(150), 
    description text
) ;

-- Creating Facilities table 
create table dbo.Facilities(
    facilities_ID serial primary key, 
    name varchar(150), 
    description text 
);

-- creating transaction table 
Create table dbo.Transaction(
    transaction_id serial primary key, 
    transaction_category_id int, 
    description text, 
    transaction_on TIMESTAMP, 
    user_id int, 
    facility_id int, 
    foreign key (transaction_category_id) references dbo.Transaction_category(transaction_category_id), 
    foreign key (user_id) REFERENCES dbo.user(user_id), 
    foreign key (facility_id) references dbo.Facilities(facilities_ID)

); 


-- creating permission table 
create table dbo.permission(
    permission_id serial primary key, 
    name varchar(100), 
    description text
); 


--creating role table 
create table dbo.role(
    role_id serial primary key, 
    name varchar(50), 
    description text 
);

--creating role_permission table 
--this table provide default permission access based on role 
create table dbo.role_permission(
    role_permission_ID serial primary key, 
    permission_id int, 
    role_id int, 
    foreign key (permission_id) references dbo.permission(permission_id), 
    foreign key (role_id) references dbo.role(role_id)
);

--creating user_role table 
create table dbo.user_role(
    user_role_id serial primary key, 
    user_id int , 
    role_id int, 
    foreign key (user_id) references dbo.user(user_id), 
    foreign key (role_id) references dbo.role(role_id)
);




