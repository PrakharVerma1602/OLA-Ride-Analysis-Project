/*Retrieve all successful booking*/
SELECT *
FROM bookings
WHERE Booking_Status = 'Successful';

/*Find the average ride distance for each vehicle type*/
SELECT 
    Vehicle_Type,
    AVG(`Ride Distance (km)`) AS Avg_Distance
FROM bookings
WHERE Booking_Status = 'Successful'
GROUP BY Vehicle_Type;

/*Get the total number of canceled rides by customer */
SELECT 
    COUNT(*) AS customer_cancelled_rides
FROM bookings
WHERE Booking_Status = 'Cancelled by Customer';

/*List all top 5 customers who booked the highest number of rides*/
SELECT 
    Customer_ID,
    COUNT(Booking_ID) AS total_rides
FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC
LIMIT 5;

/*Get the number of rides canceled by drivers due to personal and car-related issues*/
CREATE VIEW Rides_Canceled_by_Driver_P_C_Issues AS
SELECT 
    COUNT(*) AS total_driver_personal_car_issues
FROM bookings
WHERE Booking_Status = 'Cancelled by Driver'
  AND `Driver Cancel Reason` = 'Personal & Car related issues';

/*Find the maximum and minimum driver ratings for prime sedan bookings*/
CREATE VIEW Max_Min_Driver_Rating AS
SELECT 
    MAX(`Driver Ratings`) AS max_rating,
    MIN(`Driver Ratings`) AS min_rating
FROM bookings
WHERE Vehicle_Type = 'Prime Sedan'
  AND Booking_Status = 'Successful';
  
/*Retrieve all rides where payment was made using UPI*/
CREATE VIEW UPI_Payment AS
SELECT *
FROM bookings
WHERE Payment_Method = 'UPI';

/*Find the average customer rating per vehicle type*/
CREATE VIEW AVG_Customer_Rating AS
SELECT 
    Vehicle_Type,
    AVG(`Customer Rating`) AS avg_customer_rating
FROM bookings
WHERE Booking_Status = 'Successful'
GROUP BY Vehicle_Type;

/*Calculate the total booking value of rides completed successfully*/
CREATE VIEW Total_Successful_Ride_Value AS
SELECT 
    SUM(`Booking Value (INR)`) AS total_successful_ride_value
FROM bookings
WHERE Booking_Status = 'Successful';

/*List all incomplete rides with the reason */
CREATE VIEW Incomplete_Ride AS
SELECT 
    Booking_ID,
    `Incomplete Rides Reason`
FROM bookings
WHERE `Incomplete Rides` = 1;


