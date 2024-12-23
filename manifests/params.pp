# Class: postfix::params
#
# Defaults for postfix module
#
class postfix::params
{
  $postfix_package = $facts['os']['name'] ? {
    'Solaris'                       => 'CNDpostfix',
    default                         => 'postfix',
  }

  $postfix_ldap_package = $facts['os']['name'] ? {
    /Ubuntu|Debian/                 => 'postfix-ldap',
    default                         => '',
  }

  $postfix_pcre_package = $facts['os']['name'] ? {
    /Ubuntu|Debian/                 => 'postfix-pcre',
    default                         => '',
  }

  $postfix_mysql_package = $facts['os']['name'] ? {
    /Ubuntu|Debian/                 => 'postfix-mysql',
    default                         => '',
  }

  $postfix_cdb_package = $facts['os']['name'] ? {
    /Ubuntu|Debian/                 => 'postfix-cdb',
    default                         => '',
  }

  $postfix_pgsql_package = $facts['os']['name'] ? {
    /Ubuntu|Debian/                 => 'postfix-pgsql',
    default                         => '',
  }

  $postfix_package_provider = $facts['os']['name'] ? {
    'Solaris'                       => 'pkgutil',
    /(?i:CentOS|RedHat|Scientific)/ => 'yum',
    /(?i:Debian|Ubuntu)/            => 'apt',
    default                         => 'postfix',
  }

  $mailx_package = $facts['os']['name'] ? {
    'Solaris'                       => undef,
    /(?i:CentOS|RedHat|Scientific)/ => 'mailx',
    /(?i:Debian|Ubuntu)/            => 'bsd-mailx',
  }

  $service_name = $facts['os']['name'] ? {
    default => 'postfix'
  }

  $daemon_uid = $facts['os']['name'] ? {
    default                         => 'postfix'
  }

  $daemon_gid = $facts['os']['name'] ? {
    'Solaris'                       => 'other',
    default                         => 'postfix'
  }

  $data_directory = $facts['os']['name'] ? {
    default                        => '/var/lib/postfix',
  }

  $aliases_database = $facts['os']['name'] ? {
    'Solaris'                       => '/etc/mail/aliases',
    default                         => '/etc/aliases'
  }
}
