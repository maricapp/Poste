create table authors (
    author_id integer primary key,
    username text not null,
    password text not null,
    email text not null,
    full_name text not null
);

create table posts (
    post_id integer primary key,
    author_id integer not null
    constraint author_id references authors(author_id),
    publish_date integer not null,
    title text not null,
    content text not null,
    status integer not null,
    
);

create table site_configs(
    key text integer primary key,
    value text not null
);

