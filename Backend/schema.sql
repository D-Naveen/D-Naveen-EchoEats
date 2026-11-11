-- EchoEats MySQL Schema & Menu Seed
-- Import into your cloud MySQL database before starting the Django backend on Render.

CREATE TABLE IF NOT EXISTS `FoodItems` (
  `FoodID` int NOT NULL AUTO_INCREMENT,
  `FoodName` varchar(100) NOT NULL,
  `Description` text,
  `Price` decimal(10,2) NOT NULL,
  `Category` varchar(50) DEFAULT NULL,
  `ImageName` varchar(255) NOT NULL,
  `IsAvailable` tinyint(1) DEFAULT '1',
  `Rating` decimal(2,1) DEFAULT NULL,
  `DateAdded` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Quantity` int DEFAULT '0',
  `Stock` int DEFAULT '0',
  PRIMARY KEY (`FoodID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` varchar(100) NOT NULL,
  `razorpay_order_id` varchar(100) DEFAULT NULL,
  `payment_id` varchar(100) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `currency` varchar(10) DEFAULT 'INR',
  `payment_method` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'pending',
  `items` text,
  `customer_details` text,
  `signature` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_order_id` (`order_id`),
  KEY `idx_status` (`status`),
  KEY `idx_created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `session_carts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) NOT NULL,
  `food_id` int NOT NULL,
  `quantity` int DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_session_id` (`session_id`),
  KEY `idx_food_id` (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_logged_in` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `unique_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT IGNORE INTO `FoodItems`
  (`FoodID`, `FoodName`, `Description`, `Price`, `Category`, `ImageName`, `IsAvailable`, `Rating`, `Quantity`, `Stock`)
VALUES
  (1, 'Margherita Pizza', 'Classic cheese and tomato pizza', 1.00, 'Pizza', '01_Margherita.jpeg', 1, 4.5, 0, 50),
  (2, 'Farmhouse Pizza', 'Loaded with veggies and cheese', 249.00, 'Pizza', '02_Farmhouse.jpeg', 1, 4.6, 0, 40),
  (3, 'Pepperoni Pizza', 'Pepperoni slices with mozzarella cheese', 299.00, 'Pizza', '03_Pepperoni.jpeg', 1, 4.7, 0, 30),
  (4, 'Veggie Burger', 'Fresh veggies and sauces', 149.00, 'Burger', '04_VeggieBurger.jpeg', 1, 4.3, 0, 30),
  (5, 'Chicken Burger', 'Juicy chicken patty with mayo', 169.00, 'Burger', '05_ChickenBurger.jpeg', 1, 4.4, 0, 25),
  (6, 'Cheese Burst Burger', 'Cheese-filled patty', 179.00, 'Burger', '06_CheeseBurger.jpeg', 1, 4.5, 0, 20),
  (7, 'Chicken Biryani', 'Aromatic chicken biryani', 249.00, 'Main Course', '07_ChickenBiryani.jpeg', 1, 4.7, 0, 45),
  (8, 'South Indian Thali', 'Traditional South Indian full meals', 199.00, 'Main Course', '08_Thali.jpeg', 1, 4.4, 0, 35),
  (9, 'Masala Dosa', 'Crispy dosa with masala filling', 99.00, 'Snacks', '09_MasalaDosa.jpeg', 1, 4.5, 0, 60),
  (10, 'Obbattu', 'Sweet South Indian dessert (Holige)', 79.00, 'Dessert', '10_Obbattu.jpeg', 1, 4.6, 0, 40),
  (11, 'Vangibath', 'Brinjal rice with masala', 129.00, 'Main Course', '11_VangiBath.jpeg', 1, 4.3, 0, 50);
