

# Uzdevums 1 : Datu manipulēšanas (DML) pamati

# INSERT, UPDATE, REPLACE, DELETE, COMMIT, ROLLBACK



```sql
set autocommit=0;


select @@autocommit;

use petreg;

INSERT INTO `petreg`.`cattery` (`name2`) VALUES ('God Bless');
INSERT INTO `petreg`.`cattery` (`name2`) VALUES ('Chikago');

select * from cattery;

describe pet;


insert into pet(name,birth_date,pet_type,sex,cattery_id)
values
('bob2','2022-01-14','dog','M',1);

show errors;


-- connect with commaandline
-- use petreg;
-- run query, make sure there is no bob2 heeree yet.
-- select * from pet;

-- perform commit in current session
commit;

insert into pet(name,birth_date,pet_type,sex,cattery_id)
values
('bob3','2022-01-14','dog','M',1);

replace into pet(id,name,birth_date,pet_type,sex,cattery_id)
values
(3,'Flying Wing Reeeplaced','2022-01-14','dog','M',1);


delete from pet where id=3;

-- check record is added
select * from pet;

-- now rollback;
rollback;

-- aand check again. Did changes dissapeared?
select * from pet;
```


# Uzdevums 2 : Datu manipulēšana, mazliet sarežģītāk
# Vairāk INSERT, UPDATE iespēju

```sql
create table employees_copy4 select * from employees where 1<>1;

insert into employees_copy4 select * from employees;

-- thiss is not compleeeted as wheeree condition requires key column. aadd PK first
update employees_copy5 as e JOIN titles as t ON e.emp_no = t.emp_no
set e.vards = concat(e.vards, ' - ',t.title)
where e.emp_no between 10000 and 10005;

update employees_copy5 as e  
set e.vards =  (select concat(e.vards, ' --- ',t.title)  from titles as t where t.emp_no=e.emp_no LIMIT 1)   
where e.emp_no between 10000 and 10005;

show errors;
```
