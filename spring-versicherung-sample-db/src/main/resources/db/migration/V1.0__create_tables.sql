CREATE SEQUENCE person_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE
;

CREATE SEQUENCE vehicle_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE SEQUENCE contract_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;



CREATE TABLE person
(
    id             NUMBER(10) DEFAULT person_seq.nextval              NOT NULL,
    firstname      VARCHAR2(50)                                       NOT NULL,
    lastname       VARCHAR2(50)                                       NOT NULL,
    birthDate      DATE                                               NOT NULL,
    gender         VARCHAR2(10) CHECK ( gender IN ('Male', 'Female')) NOT NULL,
    address        VARCHAR2(100)                                      NOT NULL,
    email          VARCHAR2(50)                                       NOT NULL,
    identityNumber VARCHAR2(40)                                       NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE contract
(
    id             NUMBER(10) DEFAULT contract_seq.nextval                             NOT NULL,
    status         VARCHAR2(20) CHECK ( status IN ('Vorschlag', 'Antrag', 'Contract')) NOT NULL,
    typeOfContract VARCHAR2(30)                                                        NOT NULL,
    paket          VARCHAR2(20) CHECK ( paket IN ('Teilcasco', 'Vollcasco'))           NOT NULL,
    price          NUMBER(10, 2)                                                       NOT NULL,
    p_id           NUMBER,
    PRIMARY KEY (id),
    CONSTRAINT FK_CONTRACT_PERSON
        FOREIGN KEY (p_id) REFERENCES person (id)
);

CREATE TABLE vehicle
(
    id                 NUMBER(10) DEFAULT vehicle_seq.nextval NOT NULL,
    licensePlateNumber VARCHAR2(40)                                                              NOT NULL,
    typeOfVehicle      VARCHAR2(50)                                                              NOT NULL,
    color              VARCHAR2(50),
    yearOfManufacture  DATE                                                                      NOT NULL,
    fuel               VARCHAR2(50)                                                              NOT NULL,
    perform            NUMBER(10, 2)                                                             NOT NULL,
    p_id               NUMBER,
    PRIMARY KEY (id),
    CONSTRAINT FK_VEHICLE_PERSON
        FOREIGN KEY (p_id) REFERENCES person (id)
);

