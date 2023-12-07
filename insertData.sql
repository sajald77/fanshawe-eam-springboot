-- Insert into Users Table
INSERT INTO Users(user_name, phone_number, email, address, password, first_name, last_name, image_url, is_active, issued_on)
VALUES ('john_doe', '123456789', 'john.doe@gmail.com', '123 Main St', 'password', 'John', 'Doe', 'https://randomuser.me/api/portraits/men/1.jpg', true, current_date),
       ('jane_doe', '987654321', 'jane.doe@gmail.com', '456 High St', 'password', 'Jane', 'Doe', 'https://randomuser.me/api/portraits/women/1.jpg', true, current_date),
       ('mary_jane', '654321987', 'mary.jane@gmail.com', '789 Park St', 'password', 'Mary', 'Jane', 'https://randomuser.me/api/portraits/women/2.jpg', true, current_date),
       ('peter_parker', '321987654', 'peter.parker@gmail.com', '321 Park Ave', 'password', 'Peter', 'Parker', 'https://randomuser.me/api/portraits/men/2.jpg', true, current_date),
       ('tony_stark', '9876543210', 'tony.stark@gmail.com', '123 Stark Tower', 'password', 'Tony', 'Stark', 'https://randomuser.me/api/portraits/men/3.jpg', true, current_date);

-- Insert into Vendor table
INSERT INTO Vendor(vendor_name, vendor_type, address, email, image_url)
VALUES ('AMC Theatres', 'movies', 'New York, NY', 'contact@amctheatres.com', 'https://upload.wikimedia.org/wikipedia/commons/2/2b/AMC_Logo.svg'),
       ('Live Nation', 'concerts', 'Beverly Hills, CA', 'info@livenation.com', 'https://upload.wikimedia.org/wikipedia/commons/4/48/Live_nation.svg'),
       ('Delta Airlines', 'airlines', 'Atlanta, GA', 'support@delta.com', 'https://upload.wikimedia.org/wikipedia/commons/4/45/Delta_Airlines_Logo.svg'),
       ('Regal Cinemas', 'movies', 'Knoxville, TN', 'contact@regalcinemas.com', 'https://upload.wikimedia.org/wikipedia/commons/6/6f/Regal_Entertainment_Group_logo.svg'),
       ('United Airlines', 'airlines', 'Chicago, IL', 'support@united.com', 'https://upload.wikimedia.org/wikipedia/commons/1/1c/United_Airlines_logo.svg');

-- Insert into Events Table
-- Make sure to match the vendor_id with the id of the vendors inserted above
INSERT INTO Events(event_name, vendor_id, hours, capacity, location, event_from, event_to, price)
VALUES ('Avengers: Endgame Premiere', 1, 3, 500, 'New York, NY', '2019-04-22', '2019-04-28', 20),
       ('Coldplay Live Concert', 2, 2, 1000, 'Los Angeles, CA', '2022-07-15', '2022-07-15', 100),
       ('Flight to San Francisco', 3, 6, 200, 'San Francisco, CA', '2022-05-01', '2022-05-01', 150),
       ('Inception Premiere', 4, 2, 400, 'Los Angeles, CA', '2010-07-13', '2010-07-19', 15),
       ('Flight to New York', 5, 5, 180, 'New York, NY', '2022-06-01', '2022-06-01', 120);

-- Insert into Bookings Table
-- Make sure to match the user_id, event_id and vendor_id with the ids of the users, events and vendors inserted above
INSERT INTO Bookings(user_id, event_id, vendor_id, info)
VALUES (1, 1, 1, 'Booking for Avengers Premiere'),
       (2, 2, 2, 'Booking for Coldplay Concert'),
       (3, 3, 3, 'Booking for Flight to San Francisco'),
       (4, 4, 4, 'Booking for Inception Premiere'),
       (5, 5, 5, 'Booking for Flight to New York');