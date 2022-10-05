package db 

import "database/sql" 

type Store interface {
	Queries
} 
type SQLStore struct {
	db *sql.DB
	*Queries
}

func NewStore (db *sql.DB) Store {
	return &SQLStore{
		db: db,
		Queries: New(db),

	}
}

