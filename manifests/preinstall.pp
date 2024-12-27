# Class: postfix::preinstall
#
class postfix::preinstall
{
  case $facts['os']['name'] {
      /Solaris/:  { include ::postfix::preinstall::solaris}
      default:    { include ::postfix::preinstall::default}
  }
}
