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
    },
};

42;
