-- câu 1:tạo một thủ tục có tên là pro_salary để xét thưởng cuối năm như sau nếu nhân viên làm trên:
 -- a) >=9 năm thì hưởng lương là 12 triệu
 -- b) >6 năm thưởng 8 triệu
 -- c) >4 năm thưởng 6 triệu
 -- d) còn lại thưởng 5 triệu regionsregions
drop procedure if exists pro_salary;
DELIMITER $$
create procedure pro_salary()
begin 
with bt as ( select first_name ,  round(datediff( curdate() , hire_date ) / 365 , 0) as work_time, salary,
    case 
		when round(datediff( curdate() , hire_date ) / 365 , 0) >= 9 then 12000
        when round(datediff( curdate() , hire_date ) / 365 , 0) >6 then 8000
        when round(datediff( curdate() , hire_date ) / 365 , 0) >4 then 6000
        else 5000
	end as reward
    from employees )
	select first_name, work_time, salary, reward, salary + reward as total_salary
	from bt;
end;
call pro_salary
 -- câu 2:viết một thủ tục có tên là là pro_search_name tìm kím tên của một nhân viên với tên được truyền 
 -- vào sau đó cho hiển thị toàn bộ thông tin của nhân viên đó. Trong đó nối full name 
 drop procedure if exists pro_search_name;
 DELIMITER $$
 create procedure pro_search_name(f_name varchar(20))
 begin
	select employee_id , (concat(first_name,' ', last_name))  as full_name , email , 
    phone_number , hire_date , job_id , salary , manager_id , department_id
    from employees where first_name = f_name ;
 end;
 call pro_search_name('Lex')

 
 