-- pragma foreign_keys = on;
-- esta pragma precisa ser habilitada manualmente no banco

create table authors (
    username        text primary key,
    password        text not null,
    email           text not null,
    full_name       text not null
);

create table posts (
    post_id         integer primary key autoincrement,
    username        integer not null,
    publish_date    integer not null,
    title           text not null,
    content         text not null,
    status          integer not null default 1,
    foreign key (username) references authors(username)
);

-- Post status: 1 -> Created, 2 -> Deleted, 3 -> Published

create table site_configs (
    key             text text primary key,
    value           text not null
);
