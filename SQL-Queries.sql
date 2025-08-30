SELECT * FROM ola.oladata;
SELECT COUNT(*) FROM ola.oladata;


Alter table ola.oladata drop column MyUnknownColumn;

 ##  1. Retrieve all successful bookings
 CREATE VIEW Successful_Bookings AS
 SELECT * FROM ola.oladata 
 WHERE Booking_Status = "Success";
 
 Select * from Successful_Bookings;
 
 ## 2. Find the average ride distance for each vehicle type
 CREATE VIEW Avg_ride_distance_for_each_vehicle AS
 SELECT Vehicle_Type, ROUND(AVG(Ride_Distance),2) AS avg_ride FROM oladata
 GROUP BY Vehicle_Type;
 
 SELECT * FROM Avg_ride_distance_for_each_vehicle;
 
 ## 3. Get the total number of cancelled rides by customers
 CREATE VIEW Canceled_rides_by_customers AS
 SELECT Count(*) AS Rides_Canceled_by_Customers FROM oladata
 WHERE Booking_Status = "Canceled by Customer";
  
 SELECT * FROM Canceled_rides_by_customers;
 
 ## 4. List the top 5 customers who booked the highest number of rides
 CREATE VIEW Top_5_customers_with_high_rides AS
 SELECT Customer_ID, COUNT(Booking_ID) as Highest_Bookings FROM oladata
 GROUP BY Customer_ID ORDER BY Highest_Bookings DESC LIMIT 5;
 
 SELECT * FROM Top_5_customers_with_high_rides;
 
 ## 5. Get the number of rides cancelled by drivers due to personal and car-related issues
 CREATE VIEW Rides_canceled_by_Driver_P_C_issues AS
 SELECT COUNT(*) AS Total_Rides FROM oladata
 WHERE Canceled_Rides_by_Driver = "Personal & Car related issue";
 
 SELECT * FROM Rides_canceled_by_Driver_P_C_issues;
 
 ## 6. Find the maximum and minimum driver ratings for Prime Sedan bookings
 CREATE VIEW Max_Min_Driver_Ratings AS
 SELECT MAX(Driver_Ratings) AS Max_Ratings, 
 MIN(Driver_Ratings) AS Min_Ratings FROM oladata
 WHERE Vehicle_Type = "Prime Sedan";
 
 SELECT * FROM Max_Min_Driver_Ratings;
 
 ## 7. Retrieve all rides where payment was made using UPI
 CREATE VIEW UPI_Payments AS
 SELECT * FROM oladata WHERE Payment_Method = "UPI";
 
 SELECT * FROM UPI_Payments;
 
 ## 8. Find the average customer rating per vehicle type
 CREATE VIEW Avg_Customer_Rating AS
 SELECT Vehicle_Type, ROUND(AVG(Customer_Rating)) as Avg_Rating
 FROM oladata
 GROUP BY Vehicle_Type;
 
 SELECT * FROM Avg_Customer_Rating;
 
 ## 9. Calculate the total booking value of rides completed successfully
 CREATE VIEW Total_Successful_Rides_Value AS
 SELECT SUM(Booking_Value) AS Total_Booking_Value
 FROM oladata
 WHERE Booking_Status = "Success";
 
 SELECT * FROM Total_Successful_Rides_Value;
 
 ## 10. List all incomplete rides along with the reason
 SELECT Booking_ID,Vehicle_Type,Incomplete_Rides,Incomplete_Rides_Reason
 FROM oladata
 WHERE Incomplete_Rides = "Yes";