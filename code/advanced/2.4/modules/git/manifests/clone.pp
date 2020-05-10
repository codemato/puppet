class git::clone ($repo) {

    package { 'git':
        ensure => installed,
    }

    vcsrepo { "/opt/${repo}":
        ensure   => latest,
        owner    => root,
        group    => root,
        provider => git,
        require  => [ Package["git"] ],
        source   => "https://github.com/puppetlabs/${repo}.git",
        revision => 'master',
    }
}
