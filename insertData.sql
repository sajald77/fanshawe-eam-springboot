INSERT INTO Users(user_name, phone_number, email, address, password, first_name, last_name, image_url, is_active)
VALUES 
('user1', '1234567890', 'user1@email.com', 'address1', 'password1', 'firstName1', 'lastName1', 'imageUrl1', true),
('user2', '2345678901', 'user2@email.com', 'address2', 'password2', 'firstName2', 'lastName2', 'imageUrl2', true),
('user3', '3456789012', 'user3@email.com', 'address3', 'password3', 'firstName3', 'lastName3', 'imageUrl3', true),
('user4', '4567890123', 'user4@email.com', 'address4', 'password4', 'firstName4', 'lastName4', 'imageUrl4', true),
('user5', '5678901234', 'user5@email.com', 'address5', 'password5', 'firstName5', 'lastName5', 'imageUrl5', true);


INSERT INTO Vendor(vendor_name, vendor_type, address, email, image_url)
VALUES 
('vendor1', 'movies', 'address1', 'vendor1@email.com', 'imageUrl1'),
('vendor2', 'concerts', 'address2', 'vendor2@email.com', 'imageUrl2'),
('vendor3', 'airlines', 'address3', 'vendor3@email.com', 'imageUrl3'),
('vendor4', 'movies', 'address4', 'vendor4@email.com', 'imageUrl4'),
('vendor5', 'concerts', 'address5', 'vendor5@email.com', 'imageUrl5');


INSERT INTO Events(event_name, vendor_id, hours, capacity, location, event_from, event_to, price)
VALUES 
('event1', 1, 2, 100, 'location1', 'from1', 'to1', 10),
('event2', 2, 3, 200, 'location2', 'from2', 'to2', 20),
('event3', 3, 4, 300, 'location3', 'from3', 'to3', 30),
('event4', 4, 5, 400, 'location4', 'from4', 'to4', 40),
('event5', 5, 6, 500, 'location5', 'from5', 'to5', 50);


INSERT INTO Bookings(user_id, event_id, vendor_id, info)
VALUES 
(1, 1, 1, 'info1'),
(2, 2, 2, 'info2'),
(3, 3, 3, 'info3'),
(4, 4, 4, 'info4'),
(5, 5, 5, 'info5');
