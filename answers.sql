--question 1 1NF

create database products;
use products;
 -- A 1NF normalised productDetail table
create table ProductDetail(
							id int auto_increment primary key, 
                            order_id int ,
                            customer_name varchar(20),
                            products varchar(20));
                            
insert into ProductDetail(order_id,customer_name,products) values 
		(101,"John Doe","Laptop"),
        (101,"John Doe","Mouse"),
        (102,"Jane Smith","Tablet"),
        (102,"Jane Smith","Keyboard"),
        (102,"jane Smith","Mouse"),
         (103,"Emily Clark","Phone");

--## Question 2 Achieving 2NF (Second Normal Form) 🧩
use products;
--Created two tables to eliminate the partial dependencies including table product(product,OrderID ,quantity
--and table customerDetails (orderID,customerName)

CREATE TABLE CustomerDetails (
    id INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT UNIQUE,  -- Add UNIQUE constraint to OrderID
    CustomerName VARCHAR(20)
);

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    FOREIGN KEY (OrderID) REFERENCES CustomerDetails(OrderID),
    product VARCHAR(20),
    Quantity INT
);

INSERT INTO CustomerDetails (OrderID, CustomerName) VALUES
    (101, "John Doe"),
    (102, "Jane Smith"),
    (103, "Emily Clark");

INSERT INTO products (OrderID, product, Quantity) VALUES 
    (101, "Laptop", 2),
    (101, "Mouse", 1),
    (102, "Tablet", 3),
    (102, "Keyboard", 1),
    (102, "Mouse", 2),
    (103, "Phone", 1);

SELECT * FROM CustomerDetails, products;
