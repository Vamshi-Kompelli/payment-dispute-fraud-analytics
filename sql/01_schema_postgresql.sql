-- Portfolio dataset uses synthetic data only.
CREATE TABLE customers (customer_id varchar(12) PRIMARY KEY, customer_name varchar(100) NOT NULL, state varchar(40), segment varchar(20), customer_since date NOT NULL);
CREATE TABLE merchants (merchant_id varchar(12) PRIMARY KEY, merchant_name varchar(100) NOT NULL, merchant_category varchar(40), country_code char(2), baseline_risk_rate numeric(6,3));
CREATE TABLE transactions (transaction_id varchar(15) PRIMARY KEY, customer_id varchar(12) REFERENCES customers(customer_id), merchant_id varchar(12) REFERENCES merchants(merchant_id), transaction_date date NOT NULL, amount_inr numeric(14,2) CHECK(amount_inr>0), channel varchar(25), card_present boolean, country_code char(2), authorization_status varchar(20));
CREATE TABLE disputes (dispute_id varchar(15) PRIMARY KEY, transaction_id varchar(15) UNIQUE REFERENCES transactions(transaction_id), opened_date date NOT NULL, reason_code varchar(50), status varchar(25) CHECK(status IN ('OPEN','UNDER_REVIEW','RESOLVED','REJECTED')), fraud_flag boolean NOT NULL, risk_score integer CHECK(risk_score BETWEEN 0 AND 100), confirmed_loss_inr numeric(14,2) DEFAULT 0, resolution_date date, assigned_analyst varchar(40));
CREATE INDEX idx_transactions_date ON transactions(transaction_date);
CREATE INDEX idx_disputes_status_opened ON disputes(status, opened_date);
CREATE INDEX idx_disputes_fraud_risk ON disputes(fraud_flag, risk_score);
