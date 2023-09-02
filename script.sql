CREATE TABLE recipe (
    id INT PRIMARY KEY,
    recipe_name VARCHAR(255) NOT NULL,
    preparation_time INT
);

CREATE TABLE category (
    id INT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

CREATE TABLE ingredient (
    id INT PRIMARY KEY,
    ingredient_name VARCHAR(255) NOT NULL
);

CREATE TABLE step (
    id INT PRIMARY KEY,
    step_description TEXT NOT NULL
);

CREATE TABLE recipe_category (
    recipe_id INT,
    category_id INT,
    PRIMARY KEY (recipe_id, category_id),
    FOREIGN KEY (recipe_id) REFERENCES recipe(id),
    FOREIGN KEY (category_id) REFERENCES category(id)
);

CREATE TABLE recipe_ingredient (
    recipe_id INT,
    ingredient_id INT,
    PRIMARY KEY (recipe_id, ingredient_id),
    FOREIGN KEY (recipe_id) REFERENCES recipe(id),
    FOREIGN KEY (ingredient_id) REFERENCES ingredient(id)
);

CREATE TABLE recipe_step (
    recipe_id INT,
    step_id INT,
    PRIMARY KEY (recipe_id, step_id),
    FOREIGN KEY (recipe_id) REFERENCES recipe(id),
    FOREIGN KEY (step_id) REFERENCES step(id)
);

INSERT INTO category (id, category_name)
VALUES
    (1, 'Cake'),
    (2, 'No-Bake'),
    (3, 'Vegetarian'),
    (4, 'Vegan'),
    (5, 'Gluten-Free'),
    (6, 'Japanese');

INSERT INTO ingredient (id, ingredient_name)
VALUES
    (1, 'Condensed milk'),
    (2, 'Cream Cheese'),
    (3, 'Lemon Juice'),
    (4, 'Pie Crust'),
    (5, 'Cherry Jam'),
    (6, 'Brussels Sprouts'),
    (7, 'Lemon juice'),
    (8, 'Sesame seeds'),
    (9, 'Pepper'),
    (10, 'Salt'),
    (11, 'Olive oil'),
    (12, 'Macaroni'),
    (13, 'Butter'),
    (14, 'Flour'),
    (15, 'Milk'),
    (16, 'Shredded Cheddar cheese'),
    (17, 'Eggs'),
    (18, 'Soy sauce'),
    (19, 'Sugar'),
    (20, 'Salt'),
    (21, 'Olive Oil');

INSERT INTO step (id, step_description)
VALUES
    (1, 'Beat Cream Cheese'),
    (2, 'Add condensed Milk and blend'),
    (3, 'Add Lemon Juice and blend'),
    (4, 'Add the mix to the pie crust'),
    (5, 'Spread the Cherry Jam'),
    (6, 'Place in refrigerator for 3h.'),
    (7, 'Preheat the oven'),
    (8, 'Mix the ingredients in a bowl'),
    (9, 'Spread the mix on baking sheet'),
    (10, 'Bake for 30'),
    (11, 'Cook Macaroni for 8'),
    (12, 'Melt butter in a saucepan'),
    (13, 'Add flour, salt, pepper and mix'),
    (14, 'Add Milk and mix'),
    (15, 'Cook until mix is smooth'),
    (16, 'Add cheddar cheese'),
    (17, 'Add the macaroni'),
    (18, 'Beat the eggs'),
    (19, 'Add soya sauce, sugar and salt'),
    (20, 'Add oil to a sauce pan'),
    (21, 'Bring to medium heat'),
    (22, 'Add some mix to the sauce pan'),
    (23, 'Let is cook for 1'),
    (24, 'Add oil to a sauce pan'),
    (25, 'Add some mix to the sauce pan'),
    (26, 'Let is cook for 1'),
    (27, 'Remove pan from fire');

INSERT INTO recipe (id, recipe_name, preparation_time)
VALUES
    (1, 'No-Bake Cheesecake', 40),
    (2, 'Roasted Brussels Sprouts', 30),
    (3, 'Mac & Cheese', 20),
    (4, 'Tamagoyaki Japanese Omelette', 15);

INSERT INTO recipe_category (id, recipe_id, category_id)
VALUES
    (1, 1, 1),
    (2, 1, 2),
    (3, 1, 3),
    (4, 2, 4),
    (5, 2, 5),
    (6, 3, 3),
    (7, 4, 3),
    (8, 4, 6);

INSERT INTO recipe_ingredient (id, recipe_id, ingredient_id)
VALUES
    (1, 1, 1),
    (2, 1, 2),
    (3, 1, 3),
    (4, 1, 4),
    (5, 1, 5),
    (6, 2, 6),
    (7, 2, 7),
    (8, 2, 8),
    (9, 2, 9),
    (10, 2, 10),
    (11, 2, 11),
    (12, 3, 12),
    (13, 3, 13),
    (14, 3, 14),
    (15, 3, 10),
    (16, 3, 9),
    (17, 3, 15),
    (18, 3, 16),
    (19, 4, 17),
    (20, 4, 18),
    (21, 4, 19),
    (22, 4, 20),
    (23, 4, 21),
    (24, 4, 10);

INSERT INTO recipe_step (id, recipe_id, step_id)
VALUES 
    (1, 1, 1),
    (2, 1, 2),
    (3, 1, 3),
    (4, 1, 4),
    (5, 1, 5),
    (6, 1, 6), 
    (7, 2, 7),
    (8, 2, 8),
    (9, 2, 9),
    (10, 2, 10), 
    (11, 3, 11),
    (12, 3, 12),
    (13, 3, 13),
    (14, 3, 14),
    (15, 3, 15),
    (16, 3, 16),
    (17, 3, 17), 
    (18, 4, 18),
    (19, 4, 19),
    (20, 4, 20),
    (21, 4, 21),
    (22, 4, 22),
    (23, 4, 23),
    (24, 4, 24),
    (25, 4, 25),
    (26, 4, 26),
    (27, 4, 27);

SELECT r.*
FROM recipe r
JOIN recipe_ingredient ri ON r.id = ri.recipe_id
JOIN ingredient i ON ri.ingredient_id = i.id
JOIN recipe_category rc ON r.id = rc.recipe_id
JOIN category c ON rc.category_id = c.id
WHERE c.category_name = 'Vegetarian' AND i.ingredient_name = 'Potatoes';

SELECT r.*
FROM recipe r
JOIN recipe_category rc ON r.id = rc.recipe_id
JOIN category c ON rc.category_id = c.id
JOIN recipe_step rs ON r.id = rs.recipe_id
JOIN step s ON rs.step_id = s.id
WHERE c.category_name = 'Cake' AND s.step_description NOT LIKE '%Bake%';

SELECT r.*
FROM recipe r
JOIN recipe_category rc ON r.id = rc.recipe_id
JOIN category c ON rc.category_id = c.id
WHERE c.category_name = 'Vegan' OR c.category_name = 'Japanese';

/* 
-The database is in 1NF because it has a primary key, all columns contain atomic (indivisible) values and there are no repeating groups or arrays.
-The database is in 2NF because it is already in 1NF and all non-key attributes are dependent on the primary key.
-The database is in 3NF because it is already in 2NF and it does not have transitive dependencies, meaning non-key attributes are not dependent on other non-key attributes.
*/
