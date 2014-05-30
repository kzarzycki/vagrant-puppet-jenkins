Exec {
    path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ]
}

# Install some default packages
$default_packages = [ 'build-essential', 'vim', 'curl', 'git', 'subversion' ]
package { $default_packages :
    ensure => present,
    require => Exec['apt-update'],
}

include project

include project::web
include project::sql
include project::jenkins
