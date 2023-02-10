DELIMITER $$
-- Hiển thị thông báo lỗi khi nhập dữ liệu vào bảng employees mà 
-- lương không nằm trong khoảng min_salary và max_salary của job_id tương ứng trong bảng jobs
drop trigger if exists before_insert_employee_salary;
create 
trigger before_insert_employee_salary
before insert on employees
for each row
BEGIN
	DECLARE minsal INT;
	DECLARE maxsal INT;
	SELECT min_salary, max_salary INTO minsal, maxsal
	FROM jobs WHERE job_id = NEW.job_id;
	IF(NEW.salary < minsal  or NEW.salary > maxsal ) then
		signal sqlstate '45000'
        set message_text= 'The salary have to between min_salary and max_salary';
        end if;
END$$
INSERT INTO `cosodulieunc`.`employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `manager_id`, `department_id`) VALUES ('207', 'Hoc', 'Nguyen', 'thaihoc2le2@gmail.com', '089.231.2134', '2020-12-11', '1', '60000', '205', '11');
-- Hiển thị thông báo lỗi khi nhập vào hire_date lớn hơn ngày hiện tạo
DELIMITER $$
CREATE TRIGGER error_hire_date
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    IF NEW.hire_date > CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Hire date cannot be in the future.';
    END IF;
END$$
INSERT INTO `cosodulieunc`.`employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `manager_id`, `department_id`) VALUES ('207', 'Hoc', 'Nguyen', 'thaihoc2le2@gmail.com', '092.123.4123', '2024-12-22', '1', '4500', '205', '11');
