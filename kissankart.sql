drop database kissankart;
create database IF NOT EXISTS kissankart;
use kissankart;

-- User entity
CREATE TABLE IF NOT EXISTS User (
    UserId INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50),
    Password VARCHAR(255) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    MobileNumber VARCHAR(10) NOT NULL
);
INSERT INTO User (FirstName, LastName, Password, Email, MobileNumber) VALUES
  ('Hardik', 'Sachdeva', 'hardiksach', 'hardiksach129@gmail.com', 1234567890),
  ('Harsh', 'Hingorani', 'hingorani123', 'hingorani@gmail.com', 9876543210),
  ('Yash', 'Garg', 'yash@12', 'yash124@gmail.com', 5555555555),
  ('Keshav', 'Bindlish', 'keshav198', 'keshavbindl@gmail.com', 1111111111),
  ('Ayush', 'Gupta', 'guptaji', 'gupta@gmail.com', 9999999999),
  ('Madhur', 'Gupta', 'madhur@2004', 'gupta12456@gmail.com', 8888888888),
  ('Diya', 'Bansal', 'bansal123456', 'bansaldiya@gmail.com', 4444444444),
  ('Mannat', 'Dudeja', 'dudeja', 'dudejamannat@gmail.com', 7777777777),
  ('Kartik', 'Sachdeva', 'Sachdeva@123', 'kartik@gmail.com', 6666666666),
  ('Chinmai', 'Gupta', 'chinmai@23', 'guptachinmai@gmail.com', 2222222222);

-- Address
CREATE TABLE IF NOT EXISTS Address (
    Country VARCHAR(50) NOT NULL,
    State VARCHAR(50) NOT NULL,
    Pincode VARCHAR(20) NOT NULL,
    Locality VARCHAR(100) NOT NULL,
    StreetNumber VARCHAR(50) NOT NULL,
	AddressId INT PRIMARY KEY,
    FOREIGN KEY (AddressId) REFERENCES user(UserId)
);
INSERT INTO Address (Country, State, Pincode, Locality, StreetNumber, AddressId) VALUES
  ('India', 'Maharashtra', '400001', 'Fort', '1A, MG Road', 1),
  ('India', 'Karnataka', '560001', 'M.G. Road', '10, Brigade Road', 2),
  ('India', 'Delhi', '110001', 'Connaught Place', '15, Janpath', 3),
  ('India', 'Tamil Nadu', '600001', 'Mount Road', '20, Anna Salai', 4),
  ('India', 'West Bengal', '700001', 'Dalhousie Square', '25, Strand Road', 5),
  ('India', 'Gujarat', '380001', 'Ashram Road', '30, CG Road', 6),
  ('India', 'Uttar Pradesh', '226001', 'Hazratganj', '35, MG Marg', 7),
  ('India', 'Rajasthan', '302001', 'MI Road', '40, Jaipur House', 8),
  ('India', 'Kerala', '682001', 'MG Road', '45, Marine Drive', 9),
  ('India', 'Telangana', '500001', 'Abids', '50, King Koti Road', 10);

-- Products entity
CREATE TABLE IF NOT EXISTS Products (
    ProductId INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Availability BOOLEAN NOT NULL,
    Category VARCHAR(50) NOT NULL,
    Description TEXT
);

INSERT INTO Products (Name, Price, Availability, Category, Description) VALUES
  ('Seeds', 150, TRUE, 'Agricultural', 'Premium-quality seeds suitable for a variety of crops. These seeds are carefully selected to ensure optimal growth and yield in your agricultural endeavors.'),
  ('Tools Set', 1000, TRUE, 'Tools', 'Complete toolset for farming and gardening enthusiasts. This set includes essential tools designed for durability and efficiency, making it a must-have for every gardener.'),
  ('Fertilizer', 1200, TRUE, 'Fertilizer', 'Advanced general-purpose fertilizer to foster healthy plant growth. Packed with essential nutrients, this fertilizer is formulated to enhance soil fertility and promote robust plant development.'),
  ('Pesticide Spray', 600, TRUE, 'Pesticide', 'Effective insecticide spray for targeted pest control. Safeguard your plants from harmful insects with this powerful spray, providing reliable protection for your crops.'),
  ('Gloves', 400, TRUE, 'Accessories', 'Comfortable and durable gloves designed for various gardening tasks. Protect your hands while maintaining flexibility and dexterity during planting, weeding, and other garden activities.'),
  ('Water Sprinkler', 700, FALSE, 'Tools', 'Convenient and efficient irrigation kit to keep your garden well-watered. This basic sprinkler system ensures even distribution of water, promoting healthy plant growth and minimizing water wastage.'),
  ('Watering Can', 399, TRUE, 'Fertilizer', 'Easy-to-use watering can for precise and controlled watering. Ideal for applying liquid fertilizers, this can is a practical tool for maintaining proper hydration levels in your garden.'),
  ('Insect Traps', 699, TRUE, 'Pesticide', 'Specialized traps to capture and control garden insects. Employ these traps strategically to manage insect populations and protect your plants without the need for harmful chemicals.'),
  ('Grass Cutter', 999, TRUE, 'Tools', 'Efficient grass cutter designed for precise pruning and trimming. Keep your garden well-groomed with this durable tool, ensuring a neat and tidy appearance for your outdoor space.'),
  ('Manure', 399, TRUE, 'Accessories', 'Natural and nutrient-rich manure for soil enrichment. Enhance the fertility of your soil with this simple yet effective solution, providing essential nutrients to support healthy plant growth and development.');

-- Product review entity
CREATE TABLE IF NOT EXISTS ProductReview (
    ProductId INT ,
    CustomerId INT ,
    Comment TEXT ,
    Rating INT ,
    PRIMARY KEY (ProductId, CustomerId),
    FOREIGN KEY (ProductId) REFERENCES Products(ProductId),
    FOREIGN KEY (CustomerId) REFERENCES User(UserId)
);
-- Product review data entries with repeating CustomerIds
INSERT INTO ProductReview (ProductId, CustomerId, Comment, Rating) VALUES
  (1, 1, 'Excellent seeds! Grew some fantastic vegetables with these.', 5),
  (1, 3, 'Very fast delivery. Happy with the quality of the seeds.', 4),
  (2, 8, 'This tool set is amazing. It has everything I need for gardening.', 5),
  (2, 7, 'Impressed with the durability of the tools. Highly recommend!', 5),
  (3, 5, 'Great fertilizer! Noticed a significant improvement in plant growth.', 5),
  (3, 1, 'Expensive but effective. Will purchase again.', 4),
  (4, 3, 'Effective pesticide spray. Keeps my plants safe from pests.', 5),
  (4, 5, 'Works like a charm. No more pest problems in my garden.', 5),
  (5, 5, 'Comfortable gloves. Perfect for gardening tasks.', 4),
  (5, 9, 'Durable gloves. Protect my hands well during gardening.', 4);


-- Info Center entity
CREATE TABLE IF NOT EXISTS InfoCenter (
    Precautions TEXT,
    HowToUse TEXT,
    VideoLinks TEXT
);

-- Shopping Cart entity
CREATE TABLE IF NOT EXISTS ShoppingCart (
	
    ProductId INT PRIMARY KEY ,
    ProductName VARCHAR(100) NOT NULL,
    Quantity INT NOT NULL,
    TotalPrice DECIMAL(10, 2) NOT NULL,
    UserId INT,
    FOREIGN KEY (ProductId) REFERENCES Products(ProductId), 
    FOREIGN KEY (UserId) REFERENCES user(UserId) 
);

INSERT INTO ShoppingCart (ProductId, ProductName, Quantity, TotalPrice, UserId) VALUES
  (1, 'Seeds', 2, 300.00, 1),
  (2, 'Tools Set', 1, 1000.00, 2),
  (3, 'Fertilizer', 3, 3600.00, 3),
  (4, 'Pesticide Spray', 1, 600.00, 4),
  (5, 'Gloves', 2, 800.00, 5),
  (6, 'Water Sprinkler', 1, 700.00, 6),
  (7, 'Watering Can', 2, 798.00, 7),
  (8, 'Insect Traps', 2, 1398.00, 8),
  (9, 'Grass Cutter', 1, 999.00, 9),
  (10, 'Manure', 2, 798.00, 10);
  
-- Bill entity
CREATE TABLE IF NOT EXISTS Bill (
    BillId INT PRIMARY KEY auto_increment,
    DiscountCode VARCHAR(50),
    BillDate DATE NOT NULL,
    BillAmount DECIMAL(10, 2) NOT NULL,
    UserId INT,
    FOREIGN KEY (UserId) REFERENCES user(UserId) 
);

INSERT INTO Bill (DiscountCode, BillDate, BillAmount, UserId) VALUES
  ('DISCOUNT10', '2024-02-12', 300.00, 1),
  (NULL, '2024-02-13', 1000.00, 2),
  ('FEB20OFF', '2024-02-14', 3600.00, 3),
  ('SAVEMORE', '2024-02-15', 600.00, 4),
  ('WEEKENDSALE', '2024-02-16', 800.00, 5),
  ('DISCOUNT10', '2024-02-17', 700.00, 6),
  (NULL, '2024-02-18', 798.00, 7),
  ('FEB20OFF', '2024-02-19', 1398.00, 8),
  ('SAVEMORE', '2024-02-20', 999.00, 9),
  ('WEEKENDSALE', '2024-02-21', 798.00, 10);

-- Delivery agent entity
CREATE TABLE IF NOT EXISTS DeliveryAgent (
    AgentId INT PRIMARY KEY AUTO_INCREMENT,
    Password VARCHAR(255),
    Availability BOOLEAN,
    Email VARCHAR(100),
    MobileNo VARCHAR(15),
    AgentName VARCHAR(100)
);
INSERT INTO DeliveryAgent (Password, Availability, Email, MobileNo, AgentName) VALUES
  ('yashasvi123', TRUE, 'yashasvi@gmail.com', '123456789012', 'Yashasvi Sharma'),
  ('pankaj', TRUE, 'pankaj@gmail.com', '987654321098', 'Pankaj Chaudhary'),
  ('himanshi', FALSE, 'himanshi@gmail.com', '555555555555', 'Himanshi Ashra'),
  ('vansh', TRUE, 'vansh@gmail.com', '111122223333', 'Vansh Aggarwal'),
  ('kanishk', FALSE, 'kanishk@gmail.com', '999988887777', 'Kanishk Kumar'),
  ('ayaan', TRUE, 'ayaan@gmail.com', '888877776666', 'Ayaan Husan'),
  ('ayushman', TRUE, 'ayushman@gmail.com', '444433332222', 'Ayushman Sharma'),
  ('farukhi', FALSE, 'munawar@gmail.com', '777766665555', 'Munawar Farukhi'),
  ('mannara', TRUE, 'mannara@gmail.com', '666655554444', 'Mannara Chopra'),
  ('abhishek', FALSE, 'abhishek@gmail.com', '222211110000', 'Abhishek Kumar');

-- Tracking details entity
CREATE TABLE IF NOT EXISTS TrackingDetails (
    BillId INT,
    AgentPhoneNo VARCHAR(15) NOT NULL,
    DeliveryAgentId INT ,
    EstimatedTime DATETIME NOT NULL,
    FOREIGN KEY (DeliveryAgentId) references DeliveryAgent (AgentId),
    FOREIGN KEY (BillId) references bill (BillId)
);

INSERT INTO TrackingDetails (AgentPhoneNo, DeliveryAgentId, EstimatedTime, BillId) VALUES
  ('123-456-7890', 1, '2024-02-13 10:00:00', 1),
  ('987-654-3210', 2, '2024-02-14 12:00:00', 2),
  ('555-123-4567', 3, '2024-02-15 14:00:00', 3),
  ('111-222-3333', 4, '2024-02-16 16:00:00', 4),
  ('444-555-6666', 5, '2024-02-17 18:00:00', 5),
  ('789-987-6543', 1, '2024-02-18 10:00:00', 6),
  ('333-222-1111', 2, '2024-02-19 12:00:00', 7),
  ('666-777-8888', 3, '2024-02-20 14:00:00', 8),
  ('999-888-7777', 4, '2024-02-21 16:00:00', 9),
  ('123-456-7890', 5, '2024-02-22 18:00:00', 10);

-- Agent review entity
CREATE TABLE IF NOT EXISTS AgentReview (
	ReviewID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerId INT,
    AgentId INT,
    Comment TEXT,
    Rating INT,
    FOREIGN KEY (CustomerId) REFERENCES User(UserId),
    FOREIGN KEY (AgentId) REFERENCES DeliveryAgent(AgentId)
);

INSERT INTO AgentReview (CustomerId, AgentId, Comment, Rating) VALUES
  (1, 2, 'Great service, very punctual and polite delivery agent.', 5),
  (2, 4, 'The delivery was delayed, but the agent was apologetic and courteous.', 4),
  (3, 5, 'Agent was not available during the delivery window.', 2),
  (1, 4, 'Excellent service, the agent went above and beyond to ensure timely delivery.', 5),
  (5, 7, 'The agent seemed uninterested and was not helpful.', 2),
  (6, 1, 'Smooth delivery process, agent was friendly and professional.', 5),
  (3, 9, 'Package arrived damaged, agent didn''t handle it properly.', 3),
  (5, 3, 'Agent was helpful and provided updates throughout the delivery process.', 4),
  (4, 9, 'The agent was rude and didn''t follow delivery instructions.', 1),
  (1, 10, 'Delivery was on time, agent was efficient and polite.', 5);


-- Admin entity
CREATE TABLE IF NOT EXISTS Admin (
    AdminId INT PRIMARY KEY auto_increment,
    username varchar(50) NOT NULL,
    Password VARCHAR(255) NOT NULL
);
INSERT INTO Admin (username, Password)
VALUES
    ('Hardik Sachdeva', 'hardik@007'),
    ('Harsh Hingorani', 'harsh@001'),
    ('Keshav Bindlish', 'keshav@002'),
    ('Yash Garg', 'yash@004');
    