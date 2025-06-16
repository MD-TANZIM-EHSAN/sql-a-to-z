 /*create a new table called persons with columns : id,person_name,birth_date and phone*/
create table persons (
 id int not null,
 person_name varchar(255) not null,
 birth_of_date date,
 phone varchar(15) not null,
 constraint pk_persons primary key(id)
 );
 -- -----Add a new column called email to the person table ---------------------
 alter table persons
 add email varchar(25) not null ;
 -- ------------ Remove the column phone from the person table -----------------
 Alter table persons
 drop column phone;
 
 -- ------------Delete the table persons from the database ---------------------
 drop table persons