-- ПЕРЕМЕЩЕНИЕ УЗЛА
/*
1. Вверх по дереву (в область вышестоящих узлов), включает в себя:

    Перенос ветки (узла) в подчинение нижестоящему по дереву узлу;
    Перенос ветки (узла) вверх без изменения родительского узла (изменение порядка узлов);

2. Вниз по дереву (в область нижестоящих узлов), включает в себя.

    Перенос ветки в «корень» дерева (учитывая, что переносимая ветка будет последней по порядку);
    Перенос ветки (узла) вниз без изменения родительского узла (изменение порядка узлов);
    Поднятие узла (ветки) на уровень выше;
    Перемещение ветки вниз по дереву:

*/

/*
Для начала выберем ключи следующих узлов:

1. Ключи и уровень перемещаемого узла (переместим узел с id=10);
2. Уровень нового родительского узла (переместим в узел с id=9)

WITH p1 AS (
    SELECT
      level as current_lvl_item,
      left_key as left_key_current_item,
      right_key as right_key_current_item
    FROM my_tree
    WHERE id = 10
), p2 AS (
    SELECT 
        level as parent_item 
    FROM my_tree 
    WHERE id = 9
)
select level from my_tree where level = (select level from p1 )

WITH
some_data AS ( SELECT ARRAY(1,2,3) AS some_value )
SELECT * 
FROM some_table
CROSS JOIN some_data
WHERE some_table.some_field NOT IN some_data.some_value


with
somedata as ( select level, left_key, right_key from my_tree where id=10 ), somedata2 as ( select level from my_tree where id=9 )
select * from my_tree
where my_tree.level = ( select level from somedata ) or level = ( select level from somedata2 )
*/
SELECT concat(lpad('', level*2, '- '), name) AS список_узлов FROM my_tree ORDER BY left_key