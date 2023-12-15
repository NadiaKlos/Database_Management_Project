CREATE TABLE Vendor (
    businessentityid INT PRIMARY KEY,
    accountnumber VARCHAR2(20),
    name VARCHAR2(255),
    creditrating NUMBER,
    preferredvendorstatus VARCHAR(300),
    activeflag VARCHAR(300),
    purchasingwebserviceurl VARCHAR2(255),
    modifieddate TIMESTAMP
);

CREATE TABLE ProductVendor (
    productid INTEGER,
    businessentityid INTEGER,
    averageleadtime INTEGER,
    standardprice NUMBER(5, 2),
    lastreceiptcost NUMBER(7, 4),
    lastreceiptdate TIMESTAMP,
    minorderqty INTEGER,
    maxorderqty INTEGER,
    onorderqty INTEGER,
    unitmeasurecode VARCHAR2(20),
    modifieddate TIMESTAMP,
    PRIMARY KEY(productid,businessentityid)
);

CREATE TABLE PurchaseOrderDetail (
    purchaseorderid INT,
    purchaseorderdetailid INT,
    duedate TIMESTAMP,
    orderqty INT,
    productid INT,
    unitprice DECIMAL(30, 20),
    receivedqty DECIMAL(30, 20),
    rejectedqty DECIMAL(30, 20),
    modifieddate TIMESTAMP,
    PRIMARY KEY (purchaseorderid, purchaseorderdetailid)
);

CREATE TABLE PurchaseOrderHeader (
    purchaseorderid INT PRIMARY KEY,
    revisionnumber INT,
    status INT,
    employeeid INT,
    vendorid INT,
    shipmethodid INT,
    orderdate TIMESTAMP,
    shipdate TIMESTAMP,
    subtotal DECIMAL(30, 20),
    taxamt DECIMAL(30, 20),
    freight DECIMAL(30, 20),
    modifieddate TIMESTAMP
);




