# == Class consul::reload_service
#
# This class is meant to be called from certain
# configuration changes that support reload.
#
# https://www.consul.io/docs/agent/options.html#reloadable-configuration
#
class consul::reload_service {

  # Don't attempt to reload if we're not supposed to be running.
  # This can happen during pre-provisioning of a node.
  if $::consul::service_ensure != 'stopped' {
    exec { 'reload consul service':
      path        => [$consul::bin_dir,'/bin','/usr/bin'],
      command     => 'consul reload',
      refreshonly => true,
    }
  }

}
