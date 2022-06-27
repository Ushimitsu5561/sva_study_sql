 -- Выбор родительской "ветки", за отправной узел возьмем "Узел 7")  
SELECT id, name, level 
FROM my_tree 
WHERE left_key <= (SELECT left_key FROM my_tree WHERE id = 7)
AND right_key >= (SELECT right_key FROM my_tree WHERE id = 7)
ORDER BY left_key
