# Power BI Data Model
Import the four CSV files. Create one-to-many relationships:
- customers[customer_id] 1 -> * transactions[customer_id]
- merchants[merchant_id] 1 -> * transactions[merchant_id]
- transactions[transaction_id] 1 -> 0..1 disputes[transaction_id]
Create a Date table and relate Date[Date] to transactions[transaction_date] and (inactive) disputes[opened_date]. Mark Date as the date table.
