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
  brand VARCHAR(255),
  supplier_id INT REFERENCES suppliers(id) ON DELETE CASCADE,
  buying_cost FLOAT,
  selling_price FLOAT
);

CREATE TABLE rolls
(
  id SERIAL PRIMARY KEY,
  carpet_id INT REFERENCES carpets(id) ON DELETE CASCADE,
  colour VARCHAR(255),
  roll_width FLOAT,
  roll_length FLOAT
);
