 -- Выбор подчиненных узлов (за отправной узел возьмем "Узел 7" 
 -- его ключи $left_key, $right_key и уровень $level) 
 
SELECT id, name, level 
FROM my_tree 
WHERE left_key >= (SELECT left_key FROM my_tree WHERE id = 7)
AND right_key <= (SELECT right_key FROM my_tree WHERE id = 7)
ORDER BY left_key
