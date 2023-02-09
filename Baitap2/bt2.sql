-- Tạo một view xuất tên nhân viên địa chỉ nhà và thành phố của nhân viên
DELIMITER $$
create view view_address as
select first_name , street_address , city
from employees e join departments d on e.department_id=d.department_id
join locations l on d.location_id=l.location_id;
select * from view_address
-- Tạo một thủ tục thực hiện xoá một dependents với tham số là departments_id được truyền vào
DELIMITER $$
create procedure delete_dependents(id int)
begin
	delete 
    from departments where  department_id = id;
end;
call delete_dependents(1)
select * from departments
