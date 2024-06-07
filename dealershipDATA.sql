
DROP DATABASE IF EXISTS  dealership_data;

CREATE DATABASE dealership_data; 

USE dealership_data;

CREATE TABLE dealerships
( 
	dealership_id INT NOT NULL AUTO_INCREMENT, 
    full_name VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL,
    phone VARCHAR(12) NOT NULL,
    PRIMARY KEY (dealership_id)
);

CREATE TABLE vehicles
(
	VIN VARCHAR(50) NOT NULL, 
    year INT NOT NULL, 
    make VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    odometer INT NULL,
    price DOUBLE NOT NULL, 
    sold VARCHAR(50) NOT NULL,
    PRIMARY KEY (VIN)
    
);

CREATE TABLE inventory
( 
    dealership_id INT NOT NULL,
    VIN VARCHAR(50) NOT NULL,
    PRIMARY KEY(
        dealership_id,
        VIN
    )
);

CREATE TABLE sales_contracts
(
    sales_id INT NOT NULL,
    monthlyPayment DOUBLE NOT NULL,
    customer_email VARCHAR(50) NULL,
    sales_TaxAmount DOUBLE NOT NULL,
    RecodingFee INT NOT NULL,
    interest_Rate double NOT NULL, 
    
	
);



