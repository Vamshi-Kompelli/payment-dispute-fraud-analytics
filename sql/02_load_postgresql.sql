-- Run from psql while your working directory is the repository root.
\copy customers FROM 'data/customers.csv' CSV HEADER;
\copy merchants FROM 'data/merchants.csv' CSV HEADER;
\copy transactions FROM 'data/transactions.csv' CSV HEADER;
\copy disputes FROM 'data/disputes.csv' CSV HEADER;
