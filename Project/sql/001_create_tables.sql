CREATE TABLE CAR(
    VIN VARCHAR(17) NOT NULL,
    LocationID INTEGER NOT NULL,
    ModelName VARCHAR(50) NOT NULL,
    ModelYear VARCHAR(4) NOT NULL,
    ClassID INTEGER NOT NULL,
    PRIMARY KEY (VIN)
);

CREATE TABLE CAR_MODEL (
    ModelName VARCHAR(50) NOT NULL,
    ModelYear VARCHAR(4) NOT NULL,
    Make VARCHAR(50) NOT NULL,
    PRIMARY KEY (ModelName, ModelYear)
);

CREATE TABLE CAR_CLASS(
    ClassID INTEGER NOT NULL AUTO_INCREMENT,
    DailyRate DECIMAL(8,2) NOT NULL,
    WeeklyRate DECIMAL(8,2) NOT NULL,
    PRIMARY KEY (ClassID)
);

CREATE TABLE AGREEMENT(
    ContractNum INTEGER NOT NULL AUTO_INCREMENT,
    RentStart TIMESTAMP NOT NULL,
    RentEnd TIMESTAMP,
    OdomStart INTEGER NOT NULL,
    OdomEnd INTEGER,
    ReservationID INTEGER NOT NULL,
    VIN VARCHAR(17) NOT NULL,
    PRIMARY KEY (ContractNum)
);

CREATE TABLE BRANCH(
    LocationID INTEGER NOT NULL AUTO_INCREMENT,
    Address VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(11) NOT NULL,
    PRIMARY KEY (LocationID)
);

CREATE TABLE RESERVATION(
    ReservationID INTEGER NOT NULL AUTO_INCREMENT,
    DateTimeIn TIMESTAMP NOT NULL,
    DateTimeOut TIMESTAMP NOT NULL,
    LocationID INTEGER NOT NULL,
    ClassID INTEGER NOT NULL,
    LicenseNumber VARCHAR(15) NOT NULL,
    PRIMARY KEY (ReservationID)
);

CREATE TABLE CUSTOMER(
    LicenseNumber VARCHAR(15) NOT NULL,
    LicenseState VARCHAR(50),
    FName VARCHAR(50) NOT NULL,
    MInit CHAR,
    LName VARCHAR(50) NOT NULL,
    CardNum VARCHAR(19),
    PRIMARY KEY (LicenseNumber)
);

CREATE TABLE CREDIT_CARD(
    CardNum VARCHAR(19) NOT NULL,
    CardType VARCHAR(50) NOT NULL,
    ExpYear VARCHAR(4) NOT NULL,
    ExpMonth VARCHAR(2) NOT NULL,
    Address VARCHAR(50) NOT NULL,
    PRIMARY KEY (CardNum)
);

ALTER TABLE CAR
ADD FOREIGN KEY (LocationID) REFERENCES BRANCH(LocationID)
ON DELETE CASCADE;
ALTER TABLE CAR
ADD FOREIGN KEY (ModelName, ModelYear) REFERENCES CAR_MODEL(ModelName, ModelYear)
ON DELETE CASCADE;
ALTER TABLE CAR
ADD FOREIGN KEY (ClassID) REFERENCES CAR_CLASS(ClassID)
ON DELETE CASCADE;

ALTER TABLE AGREEMENT
ADD FOREIGN KEY (ReservationID) REFERENCES RESERVATION(ReservationID)
ON DELETE CASCADE;
ALTER TABLE AGREEMENT
ADD FOREIGN KEY (VIN) REFERENCES CAR(VIN)
ON DELETE CASCADE;

ALTER TABLE RESERVATION
ADD FOREIGN KEY (LocationID) REFERENCES BRANCH(LocationID)
ON DELETE CASCADE;
ALTER TABLE RESERVATION
ADD FOREIGN KEY (ClassID) REFERENCES CAR_CLASS(ClassID)
ON DELETE CASCADE;
ALTER TABLE RESERVATION
ADD FOREIGN KEY(LicenseNumber) REFERENCES CUSTOMER(LicenseNumber)
ON DELETE CASCADE;

ALTER TABLE CUSTOMER
ADD FOREIGN KEY(CardNum) REFERENCES CREDIT_CARD(CardNum)
ON DELETE CASCADE;