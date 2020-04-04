DROP TABLE cuts;
DROP TABLE rolls;
DROP TABLE carpets;
DROP TABLE suppliers;


CREATE TABLE suppliers
(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  rep VARCHAR(255),
  rep_contact VARCHAR(255)
);

CREATE TABLE carpets
(
  id SERIAL PRIMARY KEY,
  range VARCHAR(255),
  supplier_id INT REFERENCES suppliers(id) ON DELETE CASCADE,
  type VARCHAR(255),
  pile VARCHAR(255),
  colour VARCHAR(255),
  buying_cost FLOAT,
  selling_price FLOAT
);

CREATE TABLE rolls
(
  id SERIAL PRIMARY KEY,
  carpet_id INT REFERENCES carpets(id) ON DELETE CASCADE,
  width VARCHAR,
  full_rolls INT
);

CREATE TABLE cuts
(
  id SERIAL PRIMARY KEY,
  carpet_id INT REFERENCES carpets(id) ON DELETE CASCADE,
  width VARCHAR,
  cut_roll FLOAT
);
