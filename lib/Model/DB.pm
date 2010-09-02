package Model::DB;

use FindBin;

use ORLite {
    'file'      => "$FindBin::Bin/var/poste.db",
    'cleanup'   => 'VACUUM',
    'enable_fk' => 1,
    'create'    => sub {
        my $dbh = shift;
        
        $dbh->do(
            'create table authors (
                author_id       integer primary key autoincrement,
                username        text not null,
                password        text not null,
                email           text not null,
                full_name       text not null
            );'
        );
        
        $dbh->do(
            'create table posts (
                post_id         integer primary key autoincrement,
                author_id       integer not null,
                publish_date    integer not null,
                title           text not null,
                content         text not null,
                status          integer not null default 1,
                foreign key (author_id) references authors(author_id)
                    on delete cascade
            );'
        );
        
        $dbh->do(
            "insert into authors
                (username, password, email, full_name)
            values
                ('poste', 'fake password', 'poste\@blabos.org', 'Harry Poste');"
        );
        
        $dbh->do(
            "insert into posts
                (author_id, publish_date, title, content, status)
             values
                (1, 1234567890, 'First Post', 'Hello World!!!', 3);"
        );
    },
};

sub get_last_published_posts {
    my $self    = shift;
    my $count   = shift || 5;
    my $offset  = shift || 0;
    
    return Model::DB->selectall_arrayref(
        'select
            posts.post_id,
            posts.publish_date,
            posts.title,
            posts.content,
            authors.author_id,
            authors.full_name
        from
            posts, authors
        where
            posts.status = 3
            and posts.author_id = authors.author_id
        order by
            posts.publish_date desc',
        { Slice => {} },
    );
}

42;
