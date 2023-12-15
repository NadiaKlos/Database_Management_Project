// test 
select * from vendor;
select * from ProductVendor;
select * from PurchaseOrderDetail;
select * from PurchaseOrderHeader;
//A
SELECT V.name AS VendorName, PV.productid
FROM Vendor V
JOIN ProductVendor PV ON V.businessentityid = PV.businessentityid
WHERE V.creditrating = 5 AND PV.productid > 500;
//B
SELECT POH.purchaseorderid, POH.orderdate, POD.purchaseorderdetailid, POD.orderqty, POD.productid
FROM PurchaseOrderHeader POH
JOIN PurchaseOrderDetail POD ON POH.purchaseorderid = POD.purchaseorderid
WHERE POD.orderqty > 500;
//C
SELECT POH.purchaseorderid, POH.vendorid, POD.purchaseorderdetailid, POD.productid, POD.unitprice
FROM PurchaseOrderHeader POH
JOIN PurchaseOrderDetail POD ON POH.purchaseorderid = POD.purchaseorderid
WHERE POH.purchaseorderid BETWEEN 1400 AND 1600;
//D
SELECT V.businessentityid AS VendorID, V.name AS VendorName, COUNT(POH.purchaseorderid) AS OrderCount, 
       SUM(POH.subtotal) AS TotalCost
FROM Vendor V
JOIN PurchaseOrderHeader POH ON V.businessentityid = POH.vendorid
GROUP BY V.businessentityid, V.name
ORDER BY TotalCost DESC;
//E
SELECT AVG(OrderCount) AS AverageOrderCount, AVG(TotalCost) AS AverageCost
FROM (
    SELECT V.businessentityid AS VendorID, COUNT(POH.purchaseorderid) AS OrderCount, 
           SUM(POH.subtotal) AS TotalCost
    FROM Vendor V
    LEFT JOIN PurchaseOrderHeader POH ON V.businessentityid = POH.vendorid
    GROUP BY V.businessentityid
);
//F
SELECT V.businessentityid AS VendorID, V.name AS VendorName,
       (SUM(POD.rejectedqty) / NULLIF(SUM(POD.receivedqty), 0)) * 100 AS RejectionPercentage
FROM Vendor V
JOIN PurchaseOrderHeader POH ON V.businessentityid = POH.vendorid
JOIN PurchaseOrderDetail POD ON POH.purchaseorderid = POD.purchaseorderid
GROUP BY V.businessentityid, V.name
ORDER BY RejectionPercentage DESC
FETCH FIRST 10 ROWS ONLY;
//G
SELECT V.businessentityid AS VendorID, V.name AS VendorName,
       SUM(POD.orderqty) AS TotalOrderQuantity
FROM Vendor V
JOIN PurchaseOrderHeader POH ON V.businessentityid = POH.vendorid
JOIN PurchaseOrderDetail POD ON POH.purchaseorderid = POD.purchaseorderid
GROUP BY V.businessentityid, V.name
ORDER BY TotalOrderQuantity DESC
FETCH FIRST 10 ROWS ONLY;
//H
SELECT POD.productid, COUNT(*) AS TotalPurchases
FROM PurchaseOrderDetail POD
GROUP BY POD.productid
ORDER BY TotalPurchases DESC
FETCH FIRST 10 ROWS ONLY;
//I



