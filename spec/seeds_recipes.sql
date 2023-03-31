

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE recipes RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO recipes (name, avg_cooking_time, rating) VALUES ('Carbonara', 15, 5);
INSERT INTO recipes (name, avg_cooking_time, rating) VALUES ('Roast Chicken', 120, 4);
INSERT INTO recipes (name, avg_cooking_time, rating) VALUES ('salad', 7, 1);