create database database4;
use database4;

select * from logins;
select * from users;

-----	Monthly Active Users (MAU) – Count of distinct users who logged in during each month over the last 12 months.
-----   Month Retention Rate – For each signup month, calculate the percentage of users who signed up in that month and also logged in again in the following month.

WITH signup_data AS (
    SELECT 
        user_id, 
        DATE_FORMAT(STR_TO_DATE(signup_date, '%Y-%m-%d'), '%Y-%m') AS signup_month
    FROM users
),

login_data AS (
    SELECT 
        user_id, 
        DATE_FORMAT(STR_TO_DATE(login_date, '%Y-%m-%d'), '%Y-%m') AS login_month
    FROM logins
),

first_logins_after_signup AS (
    SELECT 
        s.signup_month,
        s.user_id,
        MIN(l.login_month) AS first_login_month
    FROM signup_data s
    LEFT JOIN login_data l 
      ON s.user_id = l.user_id 
     AND l.login_month > s.signup_month
    GROUP BY s.signup_month, s.user_id
),
signup_retention AS (
    SELECT
        signup_month,
        COUNT(user_id) AS signup_users,
        SUM(CASE WHEN first_login_month = DATE_FORMAT(DATE_ADD(STR_TO_DATE(CONCAT(signup_month, '-01'), '%Y-%m-%d'), INTERVAL 1 MONTH), '%Y-%m') THEN 1 ELSE 0 END) AS retained_users
    FROM first_logins_after_signup
    GROUP BY signup_month
),

monthly_active_users AS (
    SELECT
        DATE_FORMAT(STR_TO_DATE(login_date, '%Y-%m-%d'), '%Y-%m') AS month,
        COUNT(DISTINCT user_id) AS monthly_active_users
    FROM logins
   -- WHERE STR_TO_DATE(login_date, '%Y-%m-%d') >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH)
    WHERE login_date BETWEEN '2023-01-01' AND '2023-12-31'
    GROUP BY month
)

SELECT
    COALESCE(s.signup_month, m.month) AS month,
    s.signup_users,
    s.retained_users,
    ROUND((s.retained_users / s.signup_users) * 100, 1) AS retention_rate,
    m.monthly_active_users
FROM signup_retention s
LEFT JOIN monthly_active_users m
  ON s.signup_month = m.month
ORDER BY month;