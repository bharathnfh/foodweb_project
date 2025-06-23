 ###-- Mysql code to the project --###
 create  database food_project;
use food_project;
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL
);
CREATE TABLE food_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    price DOUBLE,
    image VARCHAR(100),
    category VARCHAR(50)
);
-- Veg Items (6)
INSERT INTO food_items (name, price, image, category) VALUES
('Veg Biryani', 149, 'veg_biryani.jpg', 'veg'),
('Paneer Butter Masala', 179, 'paneer.jpg', 'veg'),
('Aloo Paratha', 99, 'aloo_paratha.jpg', 'veg'),
('Palak Paneer', 159, 'palak_paneer.jpg', 'veg'),
('Mixed Veg Curry', 139, 'mixed_veg.jpg', 'veg'),
('Chole Bhature', 129, 'chole_bhature.jpg', 'veg');  -- 🆕

-- Non-Veg Items (6)
INSERT INTO food_items (name, price, image, category) VALUES
('Chicken Biryani', 189, 'chicken_biryani.jpg', 'nonveg'),
('Chicken Curry', 199, 'chicken_curry.jpg', 'nonveg'),
('Egg Masala', 129, 'egg_masala.jpg', 'nonveg'),
('Mutton Rogan Josh', 249, 'mutton_rogan_josh.jpg', 'nonveg'),
('Fish Fry', 179, 'fish_fry.jpg', 'nonveg'),
('Prawn Masala', 229, 'prawn_masala.jpg', 'nonveg');  -- 🆕

-- Soft Drinks (5 - unchanged)
INSERT INTO food_items (name, price, image, category) VALUES
('Coca Cola', 40, 'coke.jpg', 'drink'),
('Pepsi', 40, 'pepsi.jpg', 'drink'),
('Sprite', 40, 'sprite.jpg', 'drink'),
('Maaza Mango', 45, 'maaza.jpg', 'drink'),
('Fanta', 40, 'fanta.jpg', 'drink');
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    food_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (food_id) REFERENCES food_items(id)
);
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    food_id INT,
    order_time DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (food_id) REFERENCES food_items(id)
);


