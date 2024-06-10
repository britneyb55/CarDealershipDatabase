
DROP DATABASE IF EXISTS  dealership_data;

CREATE DATABASE dealership_data; 

USE dealership_data;

CREATE TABLE dealerships
( 
	dealership_id INT NOT NULL AUTO_INCREMENT, 
    name VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL,
    phone VARCHAR(12) NOT NULL,
    PRIMARY KEY (dealership_id)
);

CREATE TABLE vehicles
(
	VIN VARCHAR(50) NOT NULL, 
    year_vehicle INT NOT NULL, 
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
    PRIMARY KEY (
        dealership_id,
        VIN
    )
);

CREATE TABLE sales_contracts
(
    sales_id INT NOT NULL AUTO_INCREMENT,
    VIN VARCHAR(50) NOT NULL,
    tax_amount DOUBLE NOT NULL, 
    recording_Fee INT NOT NULL,
    processing_Fee INT NOT NULL,
    finance VARCHAR(50) NULL,
    monthly_payment DOUBLE NOT NULL,
    PRIMARY KEY (sales_id)
    
);

CREATE TABLE lease_contracts
( 
	lease_id INT NOT NULL AUTO_INCREMENT,
    VIN VARCHAR(50) NOT NULL,
    half_price DOUBLE NOT NULL,
    lease_fee DOUBLE NOT NULL,
    monthly_payment DOUBLE NOT NULL,
    PRIMARY KEY(lease_id)
    
);


INSERT INTO dealerships(dealership_id, name, address, phone)
VALUES (1, 'SuperDealer','2219 foothill blvd', '510-233-5452')
    , (2, 'BAY AREA Dealership','1198 lakeshore ave', '415-987-4433')
    , (3, 'Diamond Auto Sales','Alameda, CA ', '890-543-3311')
    , (4, 'One Toyota of Oakland','8181 Oakport St ', '510-555-2321')
    , (5, 'Coast To Coast Motors','21872 Mission Blvd', '510-989-8231');
ALTER TABLE dealerships AUTO_INCREMENT 6;


INSERT INTO vehicles(VIN, year_vehicle, make, model, odometer, price, sold)
VALUES('1H01', 1990, 'toyota', 'sedan', 21099, 15000.00, 'avaliable')
	  ,('1H02', 2002,'honda','civic',5569, 20000.00, 'avaliable')
	  ,('1H03', 2008,'Ford','Explorer',10004, 25000.00,'avaliable')
	  ,('1H04', 2012,'BMW','SUVs', 10011, 30500.00,'avaliable')
	  ,('1H05', 2021,'Mercedes-Benz',' C-Class', 100100, 40000.00, 'avaliable');

-- populate the inventory table
INSERT INTO inventory(dealership_id, VIN)
VALUES (1, '1H02')
    , (2, '1H01')
    , (3, '1H04')
    , (4, '1H03')
    , (5, '1H05')
;

-- create foreign keys

ALTER TABLE inventory 
ADD CONSTRAINT fk_vehicles_inventory
FOREIGN KEY (VIN) REFERENCES vehicles(VIN);

ALTER TABLE inventory
ADD CONSTRAINT fk_dealership_inventory
FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id);

ALTER TABLE sales_contracts 
ADD CONSTRAINT fk_sales_contracts_vehicles
FOREIGN KEY (VIN) REFERENCES vehicles(VIN);

ALTER TABLE lease_contracts 
ADD CONSTRAINT fk_lease_contracts_vehicles
FOREIGN KEY (VIN) REFERENCES vehicles(VIN);
