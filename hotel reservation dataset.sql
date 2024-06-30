use sales;
select * from hotel;
-- What is the total number of reservations in the dataset?  
select count(*) as Total_no
from hotel;

-- Which meal plan is the most popular among guests?  
select type_of_meal_plan, count(*) as No_of_orders
from hotel
group by type_of_meal_plan
order by No_of_orders desc;

-- What is the average price per room for reservations involving children? 
select round(avg(avg_price_per_room),2) as avg_per_room
from hotel
where no_of_children>0
order by no_of_children;

-- How many reservations were made for the year 20XX (replace XX with the desired year)?  
SELECT COUNT(*) AS reservation_count
FROM hotel
WHERE YEAR(STR_TO_DATE(arrival_date, '%d-%m-%Y')) = 2018;

-- What is the most commonly booked room type? 
select room_type_reserved,count(*) as Most_booked
from hotel
group by room_type_reserved
order by most_booked desc
limit 1;

-- How many reservations fall on a weekend (no_of_weekend_nights > 0)?
select count(*) as reservations_fall
from hotel
where no_of_weekend_nights>0;

-- What is the highest and lowest lead time for reservations? 
select max(lead_time) as highest_lead_time, 
       min(lead_time) as lowest_lead_time
from hotel;

-- What is the most common market segment type for reservations? 
select market_segment_type ,count(*) as Most_common
from hotel
group by market_segment_type
order by most_common desc
limit 1;

-- How many reservations have a booking status of "Confirmed"?
select ifnull(booking_status,"confirmed") as booking_status,
       count(*) as confirmed
from hotel
where booking_status="confirmed";

-- What is the total number of adults and children across all reservations?  
select sum(no_of_adults) as Total_adults,
       sum(no_of_children) as Total_children
from hotel;

--  What is the average number of weekend nights for reservations involving children?
select round(avg(no_of_weekend_nights),0) as 
           Weekend_nights_with_children
from hotel
where no_of_children>0;

--  How many reservations were made in each month of the year? 
select month(DATE_FORMAT(STR_TO_DATE(arrival_date, '%d-%m-%Y'), '%Y-%m-%d'))as months,
count(*) as No_reservations
from hotel
group by months
order by months;

--  What is the average number of nights (both weekend and weekday) spent by guests for each room type? 
select room_type_reserved as room_type,
round(avg(no_of_weekend_nights),2) as weekend_nights,
round(avg(no_of_week_nights),0) as weekday_nights
from hotel
group by room_type;

-- For reservations involving children, what is the most common room type, and what is the average price for that room type?  
select room_type_reserved,count(*) as room_type,
round(avg(avg_price_per_room),2) as avgerage_price
from hotel
where no_of_children>0
group by room_type_reserved
order by room_type desc;

-- . Find the market segment type that generates the highest average price per room. 
select market_segment_type, 
round(avg(avg_price_per_room),2) as 
              highest_avg_price_per_room
from hotel
group by market_segment_type
order by highest_avg_price_per_room desc
limit 1;


