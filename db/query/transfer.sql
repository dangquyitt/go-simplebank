-- name: CreateTransfer :one
INSERT INTO transfers (
    "from_account_number",
	"to_account_number",
	"amount"
) VALUES (
    $1, $2, $3
) RETURNING *;

-- name: GetTransferById :one
SELECT * FROM transfers
WHERE id = $1
LIMIT 1;

-- name: ListTransfers :many
SELECT * FROM transfers
WHERE
        from_account_number = $1 OR
        to_account_number = $2
ORDER BY id
    LIMIT $3
OFFSET $4;