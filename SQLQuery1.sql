drop table tb_order_itens;
drop table tb_orders;
drop table tb_products;
drop table tb_clients;
drop procedure SumTotalField;

CREATE TABLE tb_clients(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Name VARCHAR(100) NOT NULL,
	Address VARCHAR(100),
	Phone VARCHAR(20),
	Email VARCHAR(100),
	Active BIT NOT NULL DEFAULT 1
);

INSERT INTO tb_clients(name, address, phone, email)
VALUES('Client 1', 'Address 1', '(11) 1111-1111', 'email1@email.com'),
	  ('Client 2', 'Address 2', '(22) 2222-2222', 'email2@email.com'),
	  ('Client 3', 'Address 3', '(33) 3333-3333', 'email3@email.com'),
	  ('Client 4', 'Address 4', '(44) 4444-4444', 'email4@email.com'),
	  ('Client 5', 'Address 5', '(55) 5555-5555', 'email5@email.com');

CREATE TABLE tb_products(
	Id INTEGER IDENTITY(1,1) PRIMARY KEY,
	Name VARCHAR(200) NOT NULL,
	Description VARCHAR(1000),
	Price DECIMAL(18, 2) NOT NULL,
	AllowFractionate BIT NOT NULL DEFAULT 0,
	Active BIT NOT NULL DEFAULT 1
);

INSERT INTO tb_products(name, description, price, allowfractionate)
VALUES ('Beef', 'Fresh Cut with Unmatched Flavor', 59.99, 1),
	   ('Pork', 'Premium Cuts with Rich Flavor', 32.00, 1),
	   ('Pig', 'Healthy and Tasty', 600, 0);

CREATE TABLE tb_orders (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    IdClient INT NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE(),
    Total DECIMAL(18, 2) NOT NULL,
    CONSTRAINT FK_tb_orders_tb_clients FOREIGN KEY (IdClient) REFERENCES tb_clients(Id)
);

INSERT INTO tb_orders(idclient, total)
values (2, 659.99),
	   (3, 600),
	   (4, 91.99)

CREATE TABLE tb_order_itens(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	IdOrder INT NOT NULL,
	IdProduct INT NOT NULL,
	Quantity DECIMAL(18, 2) NOT NULL,
	UnitPrice DECIMAL(18, 2) NOT NULL,

	CONSTRAINT FK_tb_order_itens_tb_orders FOREIGN KEY (IdOrder) REFERENCES tb_orders(Id),
	CONSTRAINT FK_tb_order_itens_tb_Products FOREIGN KEY (IdProduct) REFERENCES tb_products(Id)	
);

insert into tb_order_itens (idorder, idproduct, quantity, unitprice)
values(1, 1, 2.50, 59.99), 
		(1, 3, 5, 600), 
		(2, 3, 5, 600), 
		(3, 1, 1.2, 59.99), 
		(3, 2, 1, 32);

CREATE PROCEDURE SumTotalField
AS
BEGIN    
    DECLARE @TotalSum DECIMAL(18, 2);
    SELECT @TotalSum = SUM(total)
    FROM tb_orders;
    SELECT @TotalSum AS TotalAmount;
END;

EXEC SumTotalField;