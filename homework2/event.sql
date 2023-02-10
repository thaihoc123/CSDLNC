-- Mỗi cá nhân tạo 2 cái trigger 2 cái event hay hay
-- tạo một event trong đó set thời gian đến ngày 16 / 2 lúc 6h30 thì chèn giữ liệu vào cho bảng employees
DELIMITER $$
create event if not exists event1day
on schedule at current_timestamp + interval 1 day
do
	insert into employees(first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
    values('Hoc','Nguyen','thaihoc2le2@gmail.com','0896200798','2020-12-11','4' , '24000', '101' , '9');
select * from employees;




