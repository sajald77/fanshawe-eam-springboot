-- Create the Users table 

CREATE TABLE Users ( 

    user_id serial primary key, 

    user_name VARCHAR(100) UNIQUE, 

    phone_number VARCHAR(15), 

    email VARCHAR(25) UNIQUE, 

    address VARCHAR(80), 

    password VARCHAR(100), 

    first_name VARCHAR(50), 

    last_name VARCHAR(50), 

    image_url VARCHAR(255), 

    is_active BOOLEAN DEFAULT FALSE, 

    issued_on DATE DEFAULT current_date 
); 

  

-- Create the Vendor table  

CREATE TABLE Vendor ( 

    vendor_id SERIAL PRIMARY KEY, 

    vendor_name VARCHAR(255) NOT NULL, 

    vendor_type VARCHAR(50) NOT NULL, 

    address VARCHAR(255), 

    email VARCHAR(255), 

    image_url VARCHAR(255)

); 

  

-- Create the Events table 

CREATE TABLE Events ( 

    event_id SERIAL PRIMARY KEY, 

    event_name VARCHAR(255) NOT NULL, 

    vendor_id INT NOT NULL, 

    hours INT, 

    capacity INT, 

    location VARCHAR(255), 

    event_from VARCHAR(255), 

    event_to VARCHAR(255), 

    price INT, 

    foreign key (vendor_id) references Vendor(vendor_id)

); 

-- Create the Bookings table 

CREATE TABLE Bookings ( 

    booking_id SERIAL PRIMARY KEY, 

    user_id INT NOT NULL,

    event_id INT NOT NULL,

    vendor_id INT NOT NULL,

    info TEXT, 

    foreign key (user_id) references Users(user_id),

    foreign key (event_id) references Events(event_id),

    foreign key (vendor_id) references Vendor(vendor_id)
); 