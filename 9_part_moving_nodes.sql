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

-- Выбор ключей перемещаемого узла
-- 1. Ключи и уровень перемещаемого узла (переместим узел с id=10);
asd integer := 5;
with
moved_node as (select level, left_key, right_key from my_tree where id=10),
-- 2. Уровень нового родительского узла (переместим в узел с id=9)
nparent_node as (select level from my_tree where id=9),
-- 3. Правый ключ узла за который мы вставляем узел (ветку)
prev_key as (select right_key=right_key-1 as right_key from my_tree where id=9);
-- 4. Определяем смещения:
--declare @skew_level integer, @skew_tree integer, @id_edit integer
skew_level integer := (select (nparent_node.level-moved_node.level+1) from nparent_node, moved_node);
skew_tree integer := (select (prev_key.right_key-moved_node.left.key+1) from prev_key, moved_node);
-- Выбираем все узлы перемещаемой ветки:
id_edit integer := (select id from my_tree where left_key >= (select left_key from moved_node) and right_key <= (select right_key from moved_node));


-- Так как при в условиях не участвуют ключи кроме изменяемых, то порядок действий не имеет значения.
update my_tree set right_key = right_key + @skew_tree WHERE right_key < (select left_key from moved_node) AND right_key > (select right_key from prev_key);
update my_tree set left_key = left_key + $skew_tree WHERE left_key < (select left_key from moved_node) AND left_key > (select right_key from prev_key)

-- Теперь можно переместить ветку:
update my_tree set left_key = left_key + $skew_edit, right_key = right_key + $skew_edit, level = level + $skew_level where id in (@id_edit) 

SELECT concat(lpad('', level*2, '- '), name) AS список_узлов FROM my_tree ORDER BY left_key