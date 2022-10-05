-- name: CreateUser :one
insert into users (
    username,
    password,
    email
)values (
    $1, $2, $3
) returning *;

-- name: GetUser :one
SELECT * FROM users WHERE  username = $1 LIMIT 1;

-- name: GetUserByID :one
SELECT * FROM users WHERE  id = $1 LIMIT 1;