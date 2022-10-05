-- name: CreateCategory :one
INSERT INTO categories (
    user_id,
    title,
    type,
    description
) VALUES (
    $1, $2, $3, $4
) 
RETURNING *;

-- name: GetCategory :one
SELECT * FROM categories WHERE  id = $1 LIMIT 1;

-- name: GetCategories :many
SELECT * FROM categories WHERE user_id = $1 AND type = $2 and title like $3 AND description like $4;

-- name: UpdateCategory :exec
UPDATE categories SET title = $2, description = $3 where id = $1 RETURNING *;

-- name: DeleteCategory :exec
DELETE FROM categories where id = $1;