# Interview Walkthrough
## Problem
Operations teams need one view of dispute volumes, monetary exposure, fraud risk, open-queue ageing, merchant concentration, and resolution performance.
## Approach
Designed a normalized PostgreSQL model, generated synthetic payment data, wrote KPI and drill-down SQL, designed a Power BI star model, and specified executive, fraud, operations, and merchant pages.
## Controls
Synthetic data only; no customer or client records. Explicit status constraints, positive amount checks, unique transaction-to-dispute relationship, indexes for date/status/risk filters, and guarded divide operations.
## What to explain
Why transaction amount and confirmed loss differ; why fraud rate needs a denominator; why high risk does not prove fraud; why open ageing should drive prioritization; and why business rules should be documented rather than implied.
