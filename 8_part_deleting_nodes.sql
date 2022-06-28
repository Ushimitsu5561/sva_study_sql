-- Удаляем узел (ветку)
-- узел ид 7, ур 3, лвк 13, прк 22
-- DELETE FROM my_tree WHERE left_key >= 13 AND right_key <= 22;

-- Обновляем ключи оставшихся веток
-- Обновление родительской ветки
-- UPDATE my_tree SET right_key = right_key-10 WHERE right_key > 22 AND left_key < 13;

-- Обновление последующих узлов
-- UPDATE my_tree SET left_key = left_key - (22 - 13 + 1), right_key = right_key - (22 - 13 + 1) WHERE left_key > 22;


select * from my_tree order by left_key