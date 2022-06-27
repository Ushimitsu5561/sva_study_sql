-- Скрипт создания таблицы Nested Set - вида древовидной структуры 
DROP TABLE IF EXISTS my_tree;
CREATE TABLE my_tree(
    id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    level INT NOT NULL DEFAULT 0,
    left_key INT NOT NULL DEFAULT 0,
    right_key INT NOT NULL DEFAULT 0
);

CREATE INDEX left_key_idx ON my_tree(left_key, right_key, level);

-- Заполняем таблицу значениями по правилам структуры
INSERT INTO my_tree(name, level, left_key, right_key) VALUES('Узел1', 1, 1, 32);
INSERT INTO my_tree(name, level, left_key, right_key) VALUES('Узел2', 2, 2, 9);
INSERT INTO my_tree(name, level, left_key, right_key) VALUES('Узел3', 2, 10, 23);
INSERT INTO my_tree(name, level, left_key, right_key) VALUES('Узел4', 2, 24, 31);
INSERT INTO my_tree(name, level, left_key, right_key) VALUES('Узел5', 3, 3, 8);
INSERT INTO my_tree(name, level, left_key, right_key) VALUES('Узел6', 3, 11, 12);
INSERT INTO my_tree(name, level, left_key, right_key) VALUES('Узел7', 3, 13, 20);
INSERT INTO my_tree(name, level, left_key, right_key) VALUES('Узел8', 3, 21, 22);
INSERT INTO my_tree(name, level, left_key, right_key) VALUES('Узел9', 3, 25, 30);
INSERT INTO my_tree(name, level, left_key, right_key) VALUES('Узел10', 4, 4, 5);
INSERT INTO my_tree(name, level, left_key, right_key) VALUES('Узел11', 4, 6, 7);
INSERT INTO my_tree(name, level, left_key, right_key) VALUES('Узел12', 4, 14, 15);
INSERT INTO my_tree(name, level, left_key, right_key) VALUES('Узел13', 4, 16, 17);
INSERT INTO my_tree(name, level, left_key, right_key) VALUES('Узел14', 4, 18, 19);
INSERT INTO my_tree(name, level, left_key, right_key) VALUES('Узел15', 4, 26, 27);
INSERT INTO my_tree(name, level, left_key, right_key) VALUES('Узел16', 4, 28, 29);

-- Сделали выборку с сортировкой в 'left_key'
SELECT concat(lpad('', level*2, '- '), name) AS список_узлов FROM my_tree ORDER BY left_key
