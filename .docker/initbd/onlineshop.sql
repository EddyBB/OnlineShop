SET CHARACTER SET utf8;

DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Purchases;

CREATE TABLE Users (
	username	VARCHAR(20) NOT NULL,
	password	VARCHAR(20) NOT NULL,
	PRIMARY KEY(username)
);

INSERT INTO Users VALUES('user1',1234);
INSERT INTO Users VALUES('user2',1234);
INSERT INTO Users VALUES('user3',1234);
INSERT INTO Users VALUES('user4',1234);

CREATE TABLE Products (
	productname	VARCHAR(20) NOT NULL,
	price		DECIMAL(10,2) NOT NULL,
	PRIMARY KEY(productname)
);

INSERT INTO Products VALUES('Ratón Inalámbrico',35.99);
INSERT INTO Products VALUES('Teclado Gaming',75);
INSERT INTO Products VALUES('Webcam 4K',59.45);
INSERT INTO Products VALUES('Lenovo Thinkpad X13',1224.12);

CREATE TABLE Purchases (
	username 	VARCHAR(20) NOT NULL,
	productname	VARCHAR(20) NOT NULL,
	date		DATETIME NOT NULL,
	price		DECIMAL(10,2) NOT NULL,
	units		INTEGER NOT NULL,
	PRIMARY KEY(username, productname, date),
	FOREIGN KEY(username) REFERENCES Users(username),
	FOREIGN KEY(productname) REFERENCES Products(productname)
);

INSERT INTO Purchases VALUES('user1','Ratón Inalámbrico',SYSDATE(),35.99,2);
INSERT INTO Purchases VALUES('user2','Teclado Gaming',SYSDATE(),60,1);
INSERT INTO Purchases VALUES('user2','Webcam 4K',SYSDATE(),59.45,11);
INSERT INTO Purchases VALUES('user3','Webcam 4K',SYSDATE(),59.45,10);
INSERT INTO Purchases VALUES('user4','Webcam 4K',CONCAT(CURRENT_DATE(),' 00:00:00'),59.45,2);
INSERT INTO Purchases VALUES('user4','Lenovo Thinkpad X13',CONCAT(CURRENT_DATE(),' 00:00:00'),1224.12,2);
