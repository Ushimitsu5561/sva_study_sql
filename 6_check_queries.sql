-- Cоздаем проверочные запросы : 
-- SELECT id FROM my_tree WHERE left_key >= right_key;
-- SELECT COUNT(id), MIN(left_key), MAX(right_key) FROM my_tree;
-- select t.ost from (SELECT id, MOD((right_key-left_key),2) AS ost FROM my_tree) as t where t.ost = 0;
-- SELECT t.ost FROM (SELECT id, MOD((left_key-level+2),2) AS ost FROM my_tree) AS t WHERE t.ost = 1 
SELECT t1.id, COUNT(t1.id), MAX(t3.right_key) FROM my_tree AS t1, my_tree AS t2, my_tree AS t3 WHERE t1.left_key <> t2.left_key AND t1.left_key <> t2.right_key AND t1.right_key <> t2.left_key AND t1.right_key <> t2.right_key GROUP BY t1.id HAVING MAX(t3.right_key) <> SQRT(4*COUNT(t1.id)+1)+1 