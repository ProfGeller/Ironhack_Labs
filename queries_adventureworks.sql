use adventureworks;
##1. Write a SELECT statement that lists the customerid along with their account number, type, the customer the city lives in and their postalcode.
SELECT c.CustomerID, c.AccountNumber, c.CustomerType, a.City, a.PostalCode
FROM customer c
JOIN customeraddress ca
ON c.CustomerID = ca.CustomerID
JOIN address a
ON ca.AddressID = a.AddressID;

#2. Write a SELECT statement that lists the 20 most recently launched products, their name and colour
SELECT p.ProductID, p.Color, p.Name
FROM product p
order by SellStartDate DESC
LIMIT 20;

# 3. Write a SELECT statement that shows how many products are on each shelf in 2/5/98, broken down by product category and subcategory
SELECT count(i.ProductID), i.Shelf, p.ProductSubcategoryID
FROM productinventory i
JOIN product p on i.ProductID = p.ProductID
WHERE i.ModifiedDate = '1998-05-02 00:00:00'
group by Shelf, p.ProductSubcategoryID, i.ModifiedDate;

# 4. I am trying to track down a vendor email address… his name is Stuart and he works at G&K Bicycle Corp. Can you help?
SELECT EmailAddress , Name
FROM vendor v
JOIN vendorcontact vc ON v.VendorID = vc.VendorID
JOIN contact c ON vc.ContactID = c.ContactID
WHERE c.FirstName = 'Stuart';

# 5. What’s the total sales tax amount for sales to Germany? What’s the top region in Germany by sales tax?
#rank, oder by limit
# Total Tax Amount = 420028, is there a subregion in germany? 
SELECT sum(TaxAmt)
FROM salesorderheader sh
JOIN SalesTerritory st ON sh.TerritoryID = st.TerritoryID
WHERE countryregioncode = 'DE';

# 6. Summarise the distinct # transactions by month

# 7. Which ( if any) of the sales people exceeded their sales quota this year and last year?
SELECT FirstName, LastName
FROM salesperson AS s
JOIN employee AS e ON s.SalesPersonID = e.EmployeeID
JOIN Contact AS c ON e.ContactID = c.ContactID 
WHERE SalesYTD > SalesQuota AND SalesLastYear > SalesQuota;

# 8. Do all products in the inventory have photos in the database and a text product descriptions?
SELECT p.name 
FROM productinventory pi
JOIN product p ON pi.ProductID = p.ProductID
JOIN productmodelproductdescriptionculture pmpd ON p.ProductModelID = pmpd.ProductModelID
JOIN productdescription pd on pmpd.ProductDescriptionID = pd.ProductDescriptionID
WHERE pd.Description IS NULL;

# 9. What's the average unit price of each product name on purchase orders which were not fully, but at least partially rejected?

# 10. How many engineers are on the employee list? Have they taken any sickleave?
# 7 Employees work in Engineering
SELECT count(d.name)
FROM employee e
JOIN EmployeeDepartmentHistory edh ON e.EmployeeID = edh.EmployeeID
JOIN Department d ON edh.DepartmentID = d.DepartmentID
WHERE d.name = "Engineering";

# all of them have taken sick leave hours
SELECT SickLeaveHours
FROM employee e
JOIN EmployeeDepartmentHistory edh ON e.EmployeeID = edh.EmployeeID
JOIN Department d ON edh.DepartmentID = d.DepartmentID
WHERE d.name = "Engineering";

# 11. How many days difference on average between the planned and actual end date of workorders in the painting stages?
# could not find information about painting
