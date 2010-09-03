-- pragma foreign_keys = on;
-- esta pragma precisa ser habilitada manualmente no banco

create table authors (
    author_id       integer primary key autoincrement,
    username        text not null,
    password        text not null,
    email           text not null,
    full_name       text not null
);

create table posts (
    post_id         integer primary key autoincrement,
    author_id       integer not null,
    publish_date    integer not null,
    title           text not null,
    content         text not null,
    status          integer not null default 1,
    foreign key (author_id) references authors(author_id)
);

-- Post status: 1 -> Created, 2 -> Deleted, 3 -> Published

create table site_configs (
    key             text text primary key,
    value           text not null
);
