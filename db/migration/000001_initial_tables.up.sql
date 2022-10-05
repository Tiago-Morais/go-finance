CREATE TABLE "users" (
    "id" serial primary key not null,
    "username" varchar not null,
    "password" varchar not null,
    "email" varchar unique not null,
    "created_at" timestamptz not null default (now())
);

CREATE TABLE "categories" (
    "id" serial primary key not null,
    "user_id"  int not null,
    "title" varchar not null,
    "type" varchar not null,
    "description" varchar not null,
    "created_at" timestamptz not null default (now())
);

alter table "categories" add constraint fk_categories_user FOREIGN key ("user_id") references "users" ("id") ;

CREATE TABLE "accounts" (
    "id" serial primary key not null,
    "user_id"  int not null,
    "category_id"  int not null,
    "title" varchar not null,
    "type" varchar not null,
    "description" varchar not null,
    "value" integer not null,
    "date" date not null,
    "created_at" timestamptz not null default (now())
);

alter table "accounts" add constraint fk_account_user FOREIGN  key ("user_id") references "users"("id") ;
alter table "accounts" add constraint fk_account_categories FOREIGN key ("category_id") references "categories"("id") ;