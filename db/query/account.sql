-- name: CreateAccount :one
INSERT INTO accounts (
    user_id,
    category_id,
    title,
    type,    
    description,
    value,
    date
) VALUES (
    $1, $2, $3, $4, $5, $6, $7
) 
RETURNING *;

-- name: GetAccount :one
SELECT * FROM accounts WHERE  id = $1 LIMIT 1;

-- name: GetAccounts :many
SELECT ac.id,
       ac.user_id,
       ac.title,       
       ac.type,
       ac.description,
       ac.value,
       ac.date,
       ac.category_id,
       ca.title as category_title
FROM accounts ac 
LEFT JOIN categories ca on ac.category_id = ca.id
WHERE ac.user_id = $1 
AND ac.type = $2 
AND ac.category_id = $3
and ac.title like $4
AND ac.description like $5
and ac.date = $6;

-- name: GetAccountReport :one
SELECT sum(value) as sum_value from accounts WHERE user_id = $1 and type = $2;

-- name: GetAccountGraph :one
SELECT COUNT(*) as count_value from accounts WHERE user_id = $1 and type = $2;

-- name: UpdateAccount :exec
UPDATE accounts SET title = $2, description = $3, value = $4 where id = $1 RETURNING *;

-- name: DeleteAccount :exec
DELETE FROM accounts where id = $1;