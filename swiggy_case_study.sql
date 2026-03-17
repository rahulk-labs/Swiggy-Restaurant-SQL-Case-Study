CREATE DATABASE SwiggyDB;
USE SwiggyDB;
select * from swiggy_data

--1. Count of Highly Rated Restaurants (> 4.5)
SELECT COUNT(DISTINCT restaurant_name) AS highest_rated_restaurants 
FROM swiggy_data 
WHERE rating > 4.5;

--2. City with the Highest Number of Restaurants
SELECT TOP 1 city, COUNT(DISTINCT restaurant_name) AS total_restaurants
FROM swiggy_data
GROUP BY city
ORDER BY total_restaurants DESC;

--3. Restaurants with "Pizza" in Their Name
SELECT COUNT(DISTINCT restaurant_name) AS restaurant_with_name_pizza 
FROM swiggy_data 
WHERE restaurant_name LIKE '%pizza%';

--4. Most Common Cuisine
SELECT TOP 1 cuisine, COUNT(*) AS most_common_cuisine 
FROM swiggy_data 
GROUP BY cuisine 
ORDER BY most_common_cuisine DESC;

--5. Average Rating per City
SELECT city, AVG(rating) AS average_rating 
FROM swiggy_data 
GROUP BY city;

--6. Highest Priced Recommended Item by Restaurant
SELECT DISTINCT restaurant_name, MAX(price) AS highest_priced_item 
FROM swiggy_data 
WHERE menu_category = 'Recommended' 
GROUP BY restaurant_name 
ORDER BY highest_priced_item DESC;

--7. Top 5 Expensive Restaurants (Any Cuisine)
SELECT TOP 5 restaurant_name, MAX(cost_per_person) AS expensive_restaurant 
FROM swiggy_data 
GROUP BY restaurant_name 
ORDER BY expensive_restaurant DESC ;

--8. Top 5 Expensive Restaurants (Excluding Indian Cuisine)
SELECT TOP 5 restaurant_name, MAX(cost_per_person) AS expensive_restaurant 
FROM swiggy_data 
WHERE cuisine <> 'INDIAN' 
GROUP BY restaurant_name 
ORDER BY expensive_restaurant DESC ;

--9. Restaurants Costlier Than Average
SELECT restaurant_name, AVG(cost_per_person) AS avg_cost
FROM swiggy_data
GROUP BY restaurant_name
HAVING AVG(cost_per_person) > (SELECT AVG(cost_per_person)FROM swiggy_data);

--10. Duplicate Restaurants (Same Name in Multiple Cities)
SELECT restaurant_name, city, COUNT(*) AS duplicate_count
FROM swiggy_data
GROUP BY restaurant_name, city
HAVING COUNT(*) > 1;

--11. Average Cost Per Person by Restaurant
SELECT restaurant_name, AVG(cost_per_person) AS avg_cost 
FROM swiggy_data 
GROUP BY restaurant_name;

--12. Cuisine-Wise Restaurant Count
SELECT cuisine, COUNT(*) AS cuisine_count 
FROM swiggy_data 
GROUP BY cuisine 
ORDER BY cuisine_count DESC;

--13. City-Wise Restaurant Count
SELECT city, COUNT(DISTINCT restaurant_name) AS restaurant_count 
FROM swiggy_data 
GROUP BY city 
ORDER BY restaurant_count DESC;

--14. City with the Highest Average Rating
SELECT TOP 1 city, AVG(rating) AS average_rating 
FROM swiggy_data 
GROUP BY city 
ORDER BY average_rating DESC;

--15. Most Expensive Menu Item Overall
SELECT TOP 1 restaurant_name, price, menu_category 
FROM swiggy_data 
ORDER BY price DESC;

--16. Veg vs Non-Veg Item Count
SELECT veg_or_nonveg, COUNT(*) AS total_items 
FROM swiggy_data 
GROUP BY veg_or_nonveg;

--17. Cuisine with the Highest Average Cost per Person
SELECT TOP 1 cuisine, AVG(cost_per_person) AS avg_cost 
FROM swiggy_data 
GROUP BY cuisine 
ORDER BY avg_cost DESC;



