-- Tạo một event xoá thông tin của employee có lương thấp nhất mỗi một tháng
drop event if exists delete_lowest_salary;
DELIMITER $$
create event if not exists delete_lowest_salary
on schedule every 1 month
do
begin
	delete from employees where salary = ( select min(salary) from employees);
end $$

-- tạo một event cộng thêm 10 vào salary của các employee có salary dưới 4000 mỗi 1 phút trong vòng 10 phút
DELIMITER $$
drop event if exists add_salary;
create event add_salary
on schedule every 1 minute
starts current_timestamp
ends current_timestamp + interval 10 minute
do
begin
update employees set salary = salary + 10 where salary < 4000;
end$$


