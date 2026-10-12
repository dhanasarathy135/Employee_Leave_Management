CREATE DATABASE IF NOT EXISTS employee_leave;
USE employee_leave;
CREATE TABLE employees(
 id INT AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(100) NOT NULL,
 email VARCHAR(120) UNIQUE NOT NULL,
 phone VARCHAR(20) NOT NULL,
 department VARCHAR(100) NOT NULL,
 password VARCHAR(255) NOT NULL,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE leave_applications(
 id INT AUTO_INCREMENT PRIMARY KEY,
 employee_id INT NOT NULL,
 leave_type VARCHAR(50) NOT NULL,
 from_date DATE NOT NULL,
 to_date DATE NOT NULL,
 days INT NOT NULL,
 reason VARCHAR(500) NOT NULL,
 status ENUM('Pending','Approved','Rejected','Cancelled') DEFAULT 'Pending',
 applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 reviewed_at DATETIME NULL,
 FOREIGN KEY(employee_id) REFERENCES employees(id) ON DELETE CASCADE
);
