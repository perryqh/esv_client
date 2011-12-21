require "esv_client/version"

base = File.expand_path(File.dirname(__FILE__))
require File.join(base, 'esv_client/version')

module EsvClient
  dir = File.expand_path('../esv_client', __FILE__)
  autoload :Client, "#{dir}/client"
  autoload :Configuration, "#{dir}/configuration"
end
