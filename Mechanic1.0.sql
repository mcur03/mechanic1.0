CREATE DATABASE mechanic_service;
USE mechanic_service;
drop DATABASE mechanic_service;

-- Crear la tabla `users`
CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  role ENUM('client', 'mechanic', 'admin') NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);SELECT * FROM users;
select * from users
where username like'me%';

DELETE FROM users;
 set sql_safe_updates=0;
-- Crear la tabla `clients`
CREATE TABLE IF NOT EXISTS clients (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  phone VARCHAR(20),
  address VARCHAR(255),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

select * from clients;

-- Crear la tabla `mechanics`
CREATE TABLE IF NOT EXISTS mechanics (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  phone VARCHAR(20),
  specialties VARCHAR(255),
  availability ENUM('yes','no') DEFAULT 'yes',
  FOREIGN KEY (user_id) REFERENCES users(id)
);
select *  from mechanics;
ALTER TABLE mechanics CHANGE COLUMN availability availability ENUM('yes','no') DEFAULT 'yes';
desc table mechanics;

-- Crear la tabla `services`
CREATE TABLE IF NOT EXISTS services (
  id INT AUTO_INCREMENT PRIMARY KEY,
  client_id INT,
  mechanic_id INT,
  description TEXT,
  status ENUM('pending', 'in_progress', 'completed'),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (client_id) REFERENCES clients(id),
  FOREIGN KEY (mechanic_id) REFERENCES mechanics(id)
);
select * from services;


/*
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  email VARCHAR(100) NOT NULL,
  role ENUM('client', 'mechanic', 'admin') NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (username, password, email, role) VALUES
('client1', '$2b$10$VpD9zjqZnUMIE5/mB8pLr.1eB77t9xhnZhlUVUPmfO30EFsAx4xuK', 'client1@example.com', 'client'), -- password1
('client2', '$2b$10$VpD9zjqZnUMIE5/mB8pLr.1eB77t9xhnZhlUVUPmfO30EFsAx4xuK', 'client2@example.com', 'client'), -- password2
('client3', '$2b$10$VpD9zjqZnUMIE5/mB8pLr.1eB77t9xhnZhlUVUPmfO30EFsAx4xuK', 'client3@example.com', 'client'), -- password3
('mechanic1', '$2b$10$VpD9zjqZnUMIE5/mB8pLr.1eB77t9xhnZhlUVUPmfO30EFsAx4xuK', 'mechanic1@example.com', 'mechanic'), -- password4
('admin1', '$2b$10$VpD9zjqZnUMIE5/mB8pLr.1eB77t9xhnZhlUVUPmfO30EFsAx4xuK', 'admin1@example.com', 'admin'); -- password5
select *  from users;
CREATE TABLE clients (
  user_id INT PRIMARY KEY,
  full_name VARCHAR(100),
  phone VARCHAR(20),
  address VARCHAR(255),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO clients (user_id, phone, address) VALUES
(1, '123-456-7890', '123 Main St, Springfield'),
(2, '234-567-8901', '456 Elm St, Springfield'),
(3, '345-678-9012', '789 Oak St, Springfield');

CREATE TABLE mechanics (
  user_id INT PRIMARY KEY,
  full_name VARCHAR(100),
  phone VARCHAR(20),
  specialties VARCHAR(255),
  availability VARCHAR(255),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO mechanics (user_id, phone, expertise) VALUES
(4, '456-789-0123', 'Engine Specialist');

CREATE TABLE services (
  id INT AUTO_INCREMENT PRIMARY KEY,
  client_id INT,
  mechanic_id INT,
  status ENUM('pending', 'in-progress', 'completed'),
  description TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (client_id) REFERENCES clients(user_id),
  FOREIGN KEY (mechanic_id) REFERENCES mechanics(user_id)
);

insert into services values(1,1,4,'pending','algo',default,default);

drop table services;
-- Eliminar la clave externa incorrecta si existe
ALTER TABLE services DROP FOREIGN KEY services_ibfk_2;

-- Agregar la clave externa correcta
ALTER TABLE services 
ADD CONSTRAINT services_ibfk_2 
FOREIGN KEY (mechanic_id) REFERENCES mechanics(id);
*/
