-- Начало раздела создания узла
-- Обновляем ключи существующего дерева, узлы стоящие за родительским узлом
-- узел ид 7, ур 3, лев 13, пр 20
-- UPDATE my_tree SET left_key = left_key + 2, right_key = right_key + 2 WHERE left_key > 20

-- Обновляем родительскую ветку
-- UPDATE my_tree SET right_key=right_key+2 WHERE right_key>=20 AND left_key<20 

--Теперь добавляем новый узел

INSERT INTO my_tree(name, left_key, right_key, level) VALUES((SELECT concat('Узел', COUNT(name) + 1) AS n FROM  my_tree), 20, 20 + 1, 3 + 1);

--UPDATE my_tree SET right_key = right_key + 2, left_key = IF(left_key > $right_key, left_key + 2, left_key) WHERE right_key >= $right_key 


--DELETE FROM my_tree WHERE id = 19;



select * from my_tree order by left_key

