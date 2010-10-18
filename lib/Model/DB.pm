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
            'create table site_configs (
                key             text text primary key,
                value           text not null
            );'
        );
        
        $dbh->do(
            "insert into authors
                (username, password, email, full_name)
            values
                ('poste', 'e10adc3949ba59abbe56e057f20f883e', 'poste\@blabos.org', 'Harry Poster');"
        );
        
        $dbh->do(
            "insert into posts
                (author_id, publish_date, title, content, status)
             values
                (1, 1234567890, 'First Post', '
                <p>Hello World!!!</p>
                <p>Este é o primeiro post e não diz nada com nada. Aproveite
                para testar os temas.</p>
                <p>Se os temas não funcionarem provavelmente deve estar ok
                também, mas só por enquanto.</p>
                <p>Mas pelo menos quatro parágrafos tem que ser vistos.</p>
                ', 3);"
        );
        
        $dbh->do("insert into site_configs (key, value)
            values ('theme', 'bamboo');"
        );
        
        $dbh->do("insert into site_configs (key, value)
            values ('posts_per_page', '5');"
        );
        
        $dbh->do("insert into site_configs (key, value)
            values ('site_title', 'Poste');"
        );
        
        $dbh->do("insert into site_configs (key, value)
            values ('site_sub_title', 'O blog que dá a luz por cima');"
        );
    },
};

sub get_last_published_posts {
    my $class   = shift;
    my $count   = shift || 5;
    my $offset  = shift || 0;
    
    return Model::DB->selectall_arrayref(
        'select
            posts.post_id,
            posts.publish_date,
            posts.title,
            posts.content,
            authors.author_id,
            authors.full_name as author
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

sub get_site_config {
    my $class   = shift;
    my $key     = shift || '';
    my $value   = '';
    
    if ($key) {
        my $conf = Model::DB::SiteConfigs->load($key);
        $value = $conf->value if defined $conf;
    }
    
    return $value;
}
sub get_post_by_id {
    my $class   = shift;
    my $post_id = shift;
    
    my $post = Model::DB::Posts->load($post_id);
    
    return defined $post ? $post : {};
}

sub get_author {
    my $class       = shift;
    my $username    = shift || '';
    
    my @users = Model::DB::Authors->select(
        'where username = ?',
        $username
    );
    
    return scalar @users > 0 ? $users[0] : {};
}

42;
