-- ANALYTICAL QUERIES



-- 1. Top 5 Most Watched Shows/Movies

SELECT c.title, COUNT(w.watch_id) AS total_views
FROM watch_history w
JOIN content c ON w.content_id = c.content_id
GROUP BY c.title
ORDER BY total_views DESC
LIMIT 5;



-- 2. Most Popular Genre by Country

SELECT u.country, c.genre, COUNT(*) AS total_views
FROM watch_history w
JOIN users u ON w.user_id = u.user_id
JOIN content c ON w.content_id = c.content_id
GROUP BY u.country, c.genre
ORDER BY total_views DESC;



-- 3. Average Watch Duration per Subscription Type

SELECT u.subscription_type, ROUND(AVG(w.watch_duration),2) AS avg_watch_time
FROM watch_history w
JOIN users u ON w.user_id = u.user_id
GROUP BY u.subscription_type;



-- 4. Top Rated Content by User Feedback

SELECT c.title, ROUND(AVG(f.rating),2) AS avg_feedback
FROM feedback f
JOIN content c ON f.content_id = c.content_id
GROUP BY c.title
ORDER BY avg_feedback DESC;



-- 5. Total Revenue by Subscription Type

SELECT u.subscription_type, SUM(s.plan_amount) AS total_revenue
FROM subscriptions s
JOIN users u ON s.user_id = u.user_id
GROUP BY u.subscription_type;



-- 6. Content Released After 2022 with Highest Ratings

SELECT title, rating, release_year
FROM content
WHERE release_year > 2022
ORDER BY rating DESC;



-- 7. Most Loyal Premium Users (Subscribed Longest)

SELECT u.name, DATEDIFF(s.end_date, s.start_date) AS days_subscribed
FROM subscriptions s
JOIN users u ON s.user_id = u.user_id
WHERE u.subscription_type = 'Premium'
ORDER BY days_subscribed DESC;



-- 8. Average User Feedback Rating by Genre

SELECT c.genre, ROUND(AVG(f.rating),2) AS avg_feedback
FROM feedback f
JOIN content c ON f.content_id = c.content_id
GROUP BY c.genre
ORDER BY avg_feedback DESC;



-- 9. List all users along with the content they watched

SELECT u.name, c.title, w.watch_date, w.watch_duration
FROM watch_history w
JOIN users u ON w.user_id = u.user_id
JOIN content c ON w.content_id = c.content_id;



-- 10. Show content that has no feedback yet 

SELECT c.title, c.genre
FROM content c
LEFT JOIN feedback f ON c.content_id = f.content_id
WHERE f.feedback_id IS NULL;



-- 11. Find most used device per user

SELECT u.name, w.device, COUNT(*) AS usage_count
FROM watch_history w
JOIN users u ON w.user_id = u.user_id
GROUP BY u.name, w.device
ORDER BY usage_count DESC;



-- 12. Retrieve subscription details with user names

SELECT u.name, s.start_date, s.end_date, s.plan_amount, s.payment_method
FROM subscriptions s
JOIN users u ON s.user_id = u.user_id;



-- 13. Most profitable countries 

SELECT u.country, SUM(s.plan_amount) AS revenue
FROM subscriptions s
JOIN users u ON s.user_id = u.user_id
GROUP BY u.country
ORDER BY revenue DESC;



-- 14. Users with Premium plan & watch time > 100 minutes total:

SELECT u.name, u.subscription_type, SUM(w.watch_duration) AS total_minutes
FROM watch_history w
JOIN users u ON w.user_id = u.user_id
WHERE u.subscription_type = 'Premium'
GROUP BY u.name, u.subscription_type
HAVING total_minutes > 100
ORDER BY total_minutes DESC;



-- 15. Most profitable countries

SELECT u.country, SUM(s.plan_amount) AS revenue
FROM subscriptions s
JOIN users u ON s.user_id = u.user_id
GROUP BY u.country
ORDER BY revenue DESC;



