-- 1. Executive KPIs
SELECT COUNT(*) AS total_disputes, SUM(t.amount_inr) AS disputed_value_inr, AVG(d.risk_score) AS avg_risk_score, SUM(d.confirmed_loss_inr) AS confirmed_loss_inr
FROM disputes d JOIN transactions t USING(transaction_id);

-- 2. Monthly trend
SELECT date_trunc('month', d.opened_date)::date AS month, COUNT(*) AS disputes, SUM(t.amount_inr) AS disputed_value_inr
FROM disputes d JOIN transactions t USING(transaction_id) GROUP BY 1 ORDER BY 1;

-- 3. Fraud by channel
SELECT t.channel, COUNT(*) FILTER (WHERE d.fraud_flag) AS fraud_disputes, COUNT(*) AS all_disputes, ROUND(100.0*COUNT(*) FILTER (WHERE d.fraud_flag)/NULLIF(COUNT(*),0),2) AS fraud_rate_pct
FROM disputes d JOIN transactions t USING(transaction_id) GROUP BY t.channel ORDER BY fraud_rate_pct DESC;

-- 4. High-risk open queue
SELECT d.dispute_id,t.transaction_id,t.amount_inr,d.reason_code,d.risk_score,d.opened_date,CURRENT_DATE-d.opened_date AS age_days
FROM disputes d JOIN transactions t USING(transaction_id) WHERE d.status IN ('OPEN','UNDER_REVIEW') AND d.risk_score>=70 ORDER BY d.risk_score DESC,t.amount_inr DESC;

-- 5. Merchant risk ranking with window function
WITH merchant_stats AS (SELECT m.merchant_name,m.merchant_category,COUNT(*) AS disputes,SUM(d.confirmed_loss_inr) AS loss_inr,AVG(d.risk_score) AS avg_risk FROM disputes d JOIN transactions t USING(transaction_id) JOIN merchants m USING(merchant_id) GROUP BY 1,2)
SELECT *,DENSE_RANK() OVER(ORDER BY loss_inr DESC) AS loss_rank FROM merchant_stats ORDER BY loss_rank LIMIT 15;

-- 6. Resolution SLA (7-day example portfolio threshold)
SELECT assigned_analyst,COUNT(*) FILTER(WHERE resolution_date IS NOT NULL) AS closed_cases,ROUND(AVG(resolution_date-opened_date),2) AS avg_resolution_days,ROUND(100.0*COUNT(*) FILTER(WHERE resolution_date-opened_date<=7)/NULLIF(COUNT(*) FILTER(WHERE resolution_date IS NOT NULL),0),2) AS within_7_day_pct
FROM disputes GROUP BY assigned_analyst ORDER BY within_7_day_pct DESC;
