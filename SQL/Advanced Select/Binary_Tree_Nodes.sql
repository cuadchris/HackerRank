/*
https://www.hackerrank.com/challenges/binary-search-tree-1/problem


You are given a table, BST, containing two columns: N and P, where N represents the value of a node in Binary
Tree, and P is the parent of N.

Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following
for each node:

Root: If node is root node.
Leaf: If node is leaf node.
Inner: If node is neither root nor leaf node.
*/

WITH p_table as
(SELECT
 CASE
     WHEN p IS NULL THEN 0
     ELSE p
 END
 FROM bst
)
SELECT n,
    CASE
        WHEN n NOT IN (SELECT * FROM p_table) THEN 'Leaf'
        WHEN n IN (SELECT * FROM p_table) AND p <> 0 THEN 'Inner'
        ELSE 'Root'
    END AS node_type
FROM bst
ORDER BY n;