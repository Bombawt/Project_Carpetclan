DROP TABLE 4m_rolls;
DROP TABLE 5m_rolls;
DROP TABLE suppliers;
DROP TABLE carpet_stock;

CREATE TABLE suppliers
(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE 4m_rolls
(
  id SERIAL PRIMARY KEY,
  full_rolls INT,
  cut_rolls FLOAT
)

CREATE TABLE 5m_rolls
(
  id SERIAL PRIMARY KEY,
  full_rolls INT,
  cut_rolls FLOAT
)

CREATE TABLE carpet_stock
(
  id SERIAL PRIMARY KEY,
  range VARCHAR(255),
  supplier_id INT REFERENCES suppliers(id),
  type VARCHAR(255),
  pile VARCHAR(255),
  colour VARCHAR(255),
  4m_roll_stock INT REFERENCES 4m_rolls(id),
  5m_roll_stock INT REFERENCES 5m_rolls(id),
  buying_cost FLOAT,
  selling_price FLOAT
);
