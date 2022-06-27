-- Выборка родительского узла
WITH preselect AS (
    SELECT
      level,
      left_key,
      right_key
    FROM my_tree
    WHERE id = 7
)

SELECT id, name, level 
FROM my_tree 
WHERE left_key <= (SELECT left_key FROM preselect)
AND right_key >= (SELECT right_key FROM preselect)
AND level = (SELECT level FROM preselect) - 1 
ORDER BY left_key;
