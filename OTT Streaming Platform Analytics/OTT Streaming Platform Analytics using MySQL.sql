CREATE DATABASE ott_analytics;
USE ott_analytics;


-- USERS TABLE
CREATE TABLE users (
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  gender CHAR(1),
  age INT,
  country VARCHAR(50),
  signup_date DATE,
  subscription_type VARCHAR(30)
);

-- CONTENT TABLE
CREATE TABLE content (
  content_id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(100),
  genre VARCHAR(50),
  type VARCHAR(10),
  release_year INT,
  rating DECIMAL(2,1)
);

-- WATCH HISTORY TABLE
CREATE TABLE watch_history (
  watch_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  content_id INT,
  watch_date DATE,
  watch_duration INT,
  device VARCHAR(30),
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (content_id) REFERENCES content(content_id)
);

-- SUBSCRIPTIONS TABLE
CREATE TABLE subscriptions (
  sub_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  start_date DATE,
  end_date DATE,
  plan_amount DECIMAL(10,2),
  payment_method VARCHAR(30),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- FEEDBACK TABLE
CREATE TABLE feedback (
  feedback_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  content_id INT,
  rating INT,
  comment TEXT,
  feedback_date DATE,
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (content_id) REFERENCES content(content_id)
);



-- USERS
INSERT INTO users (name, gender, age, country, signup_date, subscription_type) VALUES
('Aarav Sharma', 'M', 24, 'India', '2024-10-15', 'Premium'),
('Emily Johnson', 'F', 30, 'USA', '2024-08-10', 'Basic'),
('Karan Mehta', 'M', 28, 'India', '2024-09-01', 'Free'),
('Sophia Lee', 'F', 35, 'UK', '2024-07-20', 'Premium'),
('Lucas Wang', 'M', 22, 'Singapore', '2024-11-05', 'Basic');

-- CONTENT
INSERT INTO content (title, genre, type, release_year, rating) VALUES
('The Silent Ocean', 'Sci-Fi', 'Series', 2023, 8.1),
('Midnight Heist', 'Action', 'Movie', 2022, 7.8),
('Laugh Out Loud', 'Comedy', 'Series', 2024, 8.3),
('Broken Strings', 'Drama', 'Movie', 2021, 7.4),
('The Hacker Code', 'Thriller', 'Series', 2023, 8.6);

-- WATCH HISTORY
INSERT INTO watch_history (user_id, content_id, watch_date, watch_duration, device) VALUES
(1, 1, '2024-11-01', 120, 'Mobile'),
(1, 5, '2024-11-02', 90, 'Laptop'),
(2, 2, '2024-11-03', 110, 'TV'),
(3, 3, '2024-11-04', 45, 'Mobile'),
(4, 4, '2024-11-05', 130, 'TV'),
(5, 5, '2024-11-06', 100, 'Laptop');

-- SUBSCRIPTIONS
INSERT INTO subscriptions (user_id, start_date, end_date, plan_amount, payment_method) VALUES
(1, '2024-10-15', '2025-10-15', 999.00, 'UPI'),
(2, '2024-08-10', '2025-08-10', 499.00, 'Card'),
(3, '2024-09-01', '2024-10-01', 0.00, 'Free'),
(4, '2024-07-20', '2025-07-20', 999.00, 'UPI'),
(5, '2024-11-05', '2025-11-05', 499.00, 'Wallet');

-- FEEDBACK
INSERT INTO feedback (user_id, content_id, rating, comment, feedback_date) VALUES
(1, 5, 5, 'Mind-blowing series!', '2024-11-03'),
(2, 2, 4, 'Good action scenes', '2024-11-04'),
(3, 3, 3, 'Funny but slow paced', '2024-11-05'),
(4, 1, 5, 'Loved the visuals', '2024-11-06'),
(5, 4, 4, 'Nice story and acting', '2024-11-07');






