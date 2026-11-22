# Dashboard Specification
## Page 1 - Executive Overview
Cards: Total Disputes, Disputed Value INR, Fraud Dispute Rate, Confirmed Loss INR, Open Queue.
Visuals: monthly dispute trend; status distribution; disputed value by reason; top merchants by confirmed loss.
Slicers: opened month, status, reason, channel, fraud flag.

## Page 2 - Fraud Monitoring
Cards: Fraud Disputes, Average Risk Score, High Risk Open Queue.
Visuals: fraud rate by channel; risk-score bands; domestic vs international; card-present vs card-not-present; high-risk queue table.
Conditional formatting: risk >= 70 red, 50-69 amber, below 50 green.

## Page 3 - Operations and SLA
Cards: Average Resolution Days, Open Queue.
Visuals: ageing bands (0-3,4-7,8-14,15+ days); analyst throughput; resolution time by reason; open queue detail.

## Page 4 - Merchant Analysis
Visuals: top merchants by loss and disputed value; category matrix; merchant drill-through detail.

## Design
Canvas 16:9. Navy #17365D, teal #1F8A8A, amber #F4B942, red #C84630, light gray #F3F5F7. Show INR with ₹ and compact display units.
