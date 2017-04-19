SELECT name, COUNT(DISTINCT order_id) FROM order_items
GROUP BY 1
ORDER BY 1;



-- calculate number of people making these orders

SELECT name, ROUND(1.0 * COUNT(DISTINCT order_items.order_id) / COUNT (DISTINCT orders.delivered_to),2) as reorder_rate
FROM order_items
    JOIN orders ON
      orders.id = order_items.order_id
GROUP BY 1
ORDER BY 2 DESC;


SELECT *
FROM purchases
ORDER BY id
LIMIT 10;


SELECT *
FROM gameplays
ORDER BY id
LIMIT 10;




SELECT
    DATE(created_at),
    ROUND(SUM(price),2)
FROM purchases
GROUP BY 1
ORDER BY 1;



SELECT
    DATE(created_at),
    ROUND(SUM(price),2) as daily_rev
FROM purchases
WHERE refunded_at IS NOT NULL
GROUP BY 1
ORDER BY 1;


SELECT
    DATE(created_at),
  COUNT(DISTINCT(user_id)) as dau
FROM gameplays
group by 1
order by 1;


SELECT
    DATE(created_at),
  platform,
  COUNT(DISTINCT(user_id)) as dau
FROM gameplays
group by 1, 2
order by 1, 2;



SELECT
    DATE(created_at),
  ROUND(
    SUM(price) / count(DISTINCT(user_id))
    ,2) as arppu
FROM purchases
WHERE refunded_at IS NULL
group by 1
order by 1;



with daily_revenue as (
    SELECT
        date(created_at) as dt,
      round(sum(price),2) as rev
    FROM purchases
    WHERE refunded_at IS NULL
    GROUP BY 1
)
SELECT * FROM DAILY_REVENUE
ORDER BY dt;



with daily_revenue as (
    SELECT
        date(created_at) as dt,
      round(sum(price),2) as rev
    FROM purchases
    WHERE refunded_at IS NULL
    GROUP BY 1
),
daily_players as (
  select
      date(created_at) as dt,
      count(distinct (user_id)) as players
  FROM gameplays
  GROUP BY 1
)
SELECT * FROM daily_players
ORDER BY dt;

--how much the company is making per player, per day

with daily_revenue as (
    SELECT
        date(created_at) as dt,
      round(sum(price),2) as rev
    FROM purchases
    WHERE refunded_at IS NULL
    GROUP BY 1
),
daily_players as (
  select
      date(created_at) as dt,
      count(distinct (user_id)) as players
  FROM gameplays
  GROUP BY 1
)
SELECT daily_revenue.dt,
daily_revenue.rev / daily_players.players
FROM daily_revenue
JOIN daily_players
ON daily_players.dt = daily_revenue.dt;



SELECT
    DATE(created_at) as dt,
  user_id
FROM gameplays as g1
ORDER BY dt
LIMIT 100;


SELECT
    DATE(g1.created_at) as dt,
  g1.user_id
FROM gameplays as g1
    JOIN gameplays as g2 ON
  g1.user_id = g2.user_id
ORDER BY 1
LIMIT 100;



SELECT
    DATE(g1.created_at) as dt,
  g1.user_id,
  g2.user_id
FROM gameplays as g1
    JOIN gameplays as g2 ON
  g1.user_id = g2.user_id
  AND date(g1.created_at) = date(datetime(g2.created_at, '-1 day'))
ORDER BY 1
LIMIT 100;



SELECT
    DATE(g1.created_at) as dt,
  count(distinct g1.user_id) as total_users,
  count(distinct g2.user_id) as retained_users
FROM gameplays as g1
    LEFT JOIN gameplays as g2 ON
  g1.user_id = g2.user_id
  AND date(g1.created_at) = date(datetime(g2.created_at, '-1 day'))
GROUP BY 1
ORDER BY 1
LIMIT 100;



SELECT
    DATE(g1.created_at) as dt,
  round(100 * count(distinct g2.user_id) / count(distinct g1.user_id))
   as retention
FROM gameplays as g1
    LEFT JOIN gameplays as g2 ON
  g1.user_id = g2.user_id
  AND date(g1.created_at) = date(datetime(g2.created_at, '-1 day'))
GROUP BY 1
ORDER BY 1
LIMIT 100;





