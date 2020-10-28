drop table if exists USERS;
drop table if exists country;
drop table if exists inventory;
drop table if exists delivery_header;
drop table if exists delivery_details;
drop table if exists inventory_ledger_quantity;
drop table if exists inventory_ledger_amount;

create table USERS(
  ID int not null AUTO_INCREMENT,
  NAME varchar(100) not null,
  STATUS int,
  PRIMARY KEY ( ID )
);

CREATE TABLE country (
  id   INTEGER      NOT NULL AUTO_INCREMENT,
  name VARCHAR(128) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE inventory (
  id   			INTEGER      NOT NULL AUTO_INCREMENT,
  code 			VARCHAR(128) NOT NULL,
  name 			VARCHAR(128) NOT NULL,
  desc 			VARCHAR(128) NOT NULL,
  unit_price 		FLOAT,
  qty_in_stock 		FLOAT,
  unit_weight 		VARCHAR(128),
  reorder_level 	FLOAT,
  reorder_time_in_days 	FLOAT,
  reorder_qty   	FLOAT,
  discontinued  	BOOL,
  PRIMARY KEY (id)
);

CREATE TABLE inventory_ledger_quantity (
  id   			INTEGER      NOT NULL AUTO_INCREMENT,
  code 			VARCHAR(128) NOT NULL,
  name 			VARCHAR(128) NOT NULL,
  ref 			VARCHAR(128) NOT NULL,
  debit 		FLOAT,
  credit 		FLOAT,
  post_date 	DATE,
  PRIMARY KEY (id)
);

CREATE TABLE inventory_ledger_amount (
  id   			INTEGER      NOT NULL AUTO_INCREMENT,
  code 			VARCHAR(128) NOT NULL,
  name 			VARCHAR(128) NOT NULL,
  ref 			VARCHAR(128) NOT NULL,
  debit 		FLOAT,
  credit 		FLOAT,
  post_date 	DATE,
  PRIMARY KEY (id)
);


CREATE TABLE delivery_header (
  id   			INTEGER      NOT NULL AUTO_INCREMENT,
  vendor_id		INTEGER      NOT NULL,
  vendor_name 	VARCHAR(128) NOT NULL,
  receive_date 	DATE,
  user_id		INTEGER      NOT NULL,
  posted_flag	BOOL,
  post_date 	DATE,
  PRIMARY KEY (id)
);

CREATE TABLE delivery_details (
  id   			INTEGER      NOT NULL AUTO_INCREMENT,
  header_id		INTEGER      NOT NULL,
  inventory_id	INTEGER      NOT NULL,
  code 			VARCHAR(128) NOT NULL,
  name 			VARCHAR(128) NOT NULL,
  desc 			VARCHAR(128) NOT NULL,
  unit_price 	FLOAT,
  unit_weight 	VARCHAR(128),
  posted_flag	BOOL,
  post_date 	DATE,
  PRIMARY KEY (id)
);