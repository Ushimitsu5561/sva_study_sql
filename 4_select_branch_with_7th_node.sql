 -- Выбор ветки в которой участвует наш узел, за отправной узел возьмем "Узел 7")  
SELECT id, name, level 
FROM my_tree 
WHERE right_key > (SELECT left_key FROM my_tree WHERE id = 7)
AND left_key < (SELECT right_key FROM my_tree WHERE id = 7)
ORDER BY left_key
