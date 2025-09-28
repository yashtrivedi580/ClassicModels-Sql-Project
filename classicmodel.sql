use classicmodels;
#Dataset Overview
select * from customers;#salesRepEmployeeNumber
select * from employees;#employeesnumber
select * from offices;
select * from orderdetails;
select * from orders;
select * from payments;
select * from productlines; # productline
select * from products;

#List the customers in the United States with a credit limit higher than \$1000.

select * from customers where country="USA" and creditLimit>1000;

-- List the employee codes for sales representatives of customers in Spain, France and Italy.
--  Make another query to list the names and email addresses of those employees.
select salesRepEmployeeNumber,customerName,country from customers where country in("Spain","France","Italy");
#1370,1337,1401,1702
select firstName,lastName,email from employees where employeeNumber in(1370,1337,1401,1702);

#Change the job title "Sales Rep" to "Sales Representative"
update employees set jobTitle="Sales Representative" where jobTitle="Sales Rep";

#Q4 Delete the entries for Sales Representatives working in London.
#tables:offices and employees
select * from offices;
select * from offices where city="London";#7
select * from employees;#officecode
select * from employees where officecode=7;
delete from employees where officecode=7;#constraints 

#Q5 Show a list of employees who are not sales representatives
select * from employees where jobTitle!="sales representative";

#Q6Show a list of customers with "Toys" in their name
select customerName from customers where customerName like"%Toys%";

#List the 5 most expensive products from the "Planes" product line
select productName,productline,buyPrice from products where productLine="Planes" order by buyPrice desc limit 5;

#Identify the products that are about to run out of stock (quantity in stock < 100)
select productName,quantityInStock from products where quantityInStock<100;

#List 10 products in the "Motorcycles" category with the lowest buy price and more than 1000 units in stock
select productName,productline,buyPrice,quantityInStock from products where productLine="Motorcycles" and quantityInStock>1000 order by buyPrice limit 10;

#Aggregation, Grouping and Aliases
#QUESTION: Report the total number of payments received before October 28, 2004.
select count(customerNumber) from payments where paymentDate<"2004-10-28";

#QUESTION: Report the number of customer who have made payments before October 28, 2004.
select count(distinct(customerNumber)) from payments where paymentDate<"2004-10-28";

#QUESTION: Retrieve the list of customer numbers for customer who have made a payment before October 28, 2004.
select distinct customerNumber from payments where paymentDate<"2004-10-28";

#QUESTION: Retrieve the details all customers who have made a payment before October 28, 2004.
select distinct customerNumber,paymentDate from payments where paymentDate<"2004-10-28" group by customerNumber,paymentDate;
select * from payments;
select * from customers;

#EXERCISE: Retrieve details of all the customers in the United States who have made payments between April 1st 2003 and March 31st 2004.
use classicmodels;
select * from customers;
select * from payments;
select C.customerNumber,C.customerName,C.country,P.amount as Payments,P.paymentDate from customers C left join payments P on C.customerNumber=P.customerNumber where C.country="USA" and paymentDate between "2003-04-01" and "2004-03-31";
#QUESTION: Find the total number of payments made each customer before October 28, 2004.
select customerNumber, count(*) as total_payments from payments where  paymentDate<"2004-10-28" group by customerNumber; 

#QUESTION: Find the total amount paid by each customer payment before October 28, 2004.
select customerNumber,sum(amount) as total_amount from payments where paymentDate<"2004-10-28" group by customerNumber,paymentDate;

#EXERCISE: Determine the total number of units sold for each product
select * from orderdetails;
select * from products;
select productCode,sum(quantityOrdered) as total_unitsold from orderdetails group by productCode;

#sum and count
#QUESTION: Find the total no. of payments and total payment amount for each customer for payments made before October 28, 2004.
select customerNumber,count(checkNumber) as total_no_of_payments,sum(amount) as total_paymentamount from payments where  paymentDate<"2004-10-28" group by customerNumber;

#EXERCISE: Modify the above query to also show the minimum, maximum and average payment value for each customer.
select customerNumber,min(amount),max(amount),avg(amount) from payments group by customerNumber;

#ORDER BY and LIMIT
#QUESTION: Retrieve the customer number for 10 customers who made the highest total payment in 2004.
select customerNumber,sum(amount) as Total_payments from payments where year(paymentDate)='2004' group by customerNumber order by Total_payments desc limit 10;

##QUESTION: Retrieve the customer number for 10 customers and to get the next 10 result who made the highest total payment in 2004.
select customerNumber,sum(amount) as Total_payments from payments where year(paymentDate)='2004' group by customerNumber order by Total_payments desc limit 10 offset 10;

#Mapping Functions
#UCASE and CONCAT
#QUESTION: Display the full name of point of contact each customer in the United States in upper case, along with their phone number, sorted by alphabetical order of customer name.
select customerName,ucase(concat(contactlastName,contactfirstName)) as Full_Name,phone,country from customers where country="USA" order by customerName;

#QUESTION: Display a paginated list of customers (sorted by customer name), with a country code column. The country is simply the first 3 letters in the country name, in lower case.
select customerName,lcase(left(country,3)) as country_code from customers order by customerName;

#QUESTION: Display the list of the 5 most expensive products in the "Motorcycles" product line with their price (MSRP) rounded to dollars.
select * from products;
select productName,concat("$",round(msrp,0)) as Price from products where productLine="Motorcycles" order by msrp desc limit 5;

#Arithmetic Operations
#QUESTION: Display the product code, product name, buy price, sale price and profit margin percentage ((MSRP - buyPrice)*100/buyPrice) for the 10 products with the highest profit margin. Round the profit margin to 2 decimals.
select * from products;
select productCode,productName,buyPrice,round(((MSRP - buyPrice)*100/buyPrice),2) as Profit_Margin from products order by Profit_Margin desc limit 10;

#Working with Dates
#QUESTION: List the largest single payment done by every customer in the year 2004, ordered by the transaction value (highest to lowest).
select * from payments;
select customerNumber,max(amount) as largest_payments from payments where year(paymentDate)=2004 group by customerNumber order by largest_payments desc;

#QUESTION: Show the total payments received month by month for every year.
select year(paymentDate) as year,month(paymentDate) as month,sum(amount)as total_payment from payments group by year,month;

#DATE_FORMAT and FORMAT
#QUESTION: For the above query, format the amount properly with a dollar symbol and comma separation (e.g $26,267.62), and also show the month as a string.
select date_format(paymentDate,"%M") as month_Name,year(paymentDate) as year,concat("$",format(sum(amount),1)) as total_payment from payments group by year,month_Name;

#Joins
#QUESTION: Show the 10 most recent payments with customer details (name & phone no.).Inner join
select * from customers;
select P.customerNumber,C.customerName,C.phone,P.amount,P.paymentDate from 
payments P inner join customers C on P.customerNumber=C.customerNumber order by P.paymentDate desc limit 10;

#EXERCISE: Show the full office address and phone number for each employee.
select * from offices;
select * from employees;
select F.officeCode,E.employeeNumber,F.addressLine1,F.phone from 
offices F left join employees E on F.officeCode=E.officeCode ;

#EXERCISE: Show the full order information and product details for order no. 10100.
select * from orders;#ordernumber
select * from orderdetails;#productcode
select * from products;
select  O.orderNumber,P.productCode,O.orderDate,O.requiredDate,O.shippedDate,
P.productName,P.productVendor,P.productDescription,P.quantityInStock,P.buyPrice,P.MSRP,P.productLine 
from orders O join orderdetails ord on O.orderNumber=ord.orderNumber join products P on ord.productCode=P.productCode where O.orderNumber=10100;

#self join
#QUESTION: Show a list of employees with the name & employee number of their manager.
select * from employees;
select E.employeeNumber,E.firstName,E.lastName,M.employeeNumber as managernumber,concat(M.firstName," ",M.lastName) as managerName from employees E left join employees M on M.reportsTo=E.employeeNumber;


 
	















#EXERCISES

use `classicmodels`;
select * from customers;
select * from offices;
select * from employees;
select * from products;
select * from productlines;
select * from orders;
select * from orderdetails;
select * from payments;

#Report the account representative for each customer

#Report total payments for Atelier graphique.

select C.customerNumber,C.customerName,sum(amount) as Total_payments from customers C left join payments P on C.customerNumber=P.customerNumber group by C.customerNumber,C.customerName having C.customerName="Atelier graphique";

#Report the total payments by date
select paymentDate,sum(amount) from payments group by paymentDate;

#List the amount paid by each customer.
select customerNumber,amount from payments group by customerNumber;

#List products sold by order date.
select * from products;#productcode
select * from orderdetails;
select * from orders;#order number

select P.productCode,O.orderNumber,P.productName,P.productVendor,P.productLine,O.orderDate,OD.quantityOrdered,OD.priceEach,
(quantityOrdered * priceEach) as total_amount from products P 
join orderdetails OD on P.productCode=OD.productCode 
join orders O on OD.orderNumber=O.orderNumber order by orderNumber,orderDate;


 #How many orders have been placed by Herkku Gifts?
 select * from customers where customerName="Herkku Gifts";
 select * from customers;
 select * from orders;
 select O.customerNumber,C.customerName,count(orderNumber) as Total_orders from orders O left join customers C on O.customerNumber=C.customerNumber group by O.customerNumber,C.customerName having customerName="Herkku Gifts";
 

#Who are the employees in Boston?
select * from employees;
select * from offices;
select employeeNumber,city from employees e left join offices o on e.officeCode=o.officeCode where city="Boston";



#Report those payments greater than \$100,000. Sort the report so the customer who made the highest payment appears first.
select * from customers;
select * from payments;
select customerNumber,amount from payments where amount>1000000 order by amount desc;

#List the value of 'On Hold' orders.
select * from orders;
select * from payments;
select status from orders where status="On Hold";#unique on hold
select o.customerNumber,status,amount from orders o join payments p on o.customerNumber=p.customerNumber where status="On Hold";

#Report the number of orders 'On Hold' for each customer.
select count(orderNumber),status from orders where status="On Hold";
select customerNumber,status,count(orderNumber) as Number_orders from orders where status="On Hold" group by customerNumber,status;

-- List the order dates in descending order for orders for the 1940 Ford Pickup Truck.
select * from orders;
select * from orderdetails;
select * from products;

select o.orderNumber,o.orderDate,p.productCode,p.productName from orders o
 join orderdetails ord on o.orderNumber=ord.orderNumber
 join products p on p.productCode=ord.productCode where 
 p.productName="1940 Ford Pickup Truck" order by o.orderDate desc;
 
 #-- List the names of customers and their corresponding order number where a particular order from that customer has a 13. value greater than $25,000?
 select * from customers;
 select * from orders;
 select * from orderdetails;
 select o.orderNumber,customerName,sum(quantityOrdered*priceEach) as order_totalvalue from customers c join orders o on c.customerNumber=o.customerNumber join orderdetails ord on o.orderNumber=ord.orderNumber group by orderNumber,customerName having order_totalvalue>25000;

-- Are there any products that appear on all orders?
select * from products;
select * from orderdetails;
select * from orders;




