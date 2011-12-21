$:.unshift File.expand_path('..', __FILE__)
$:.unshift File.expand_path('../../lib', __FILE__)

require 'rubygems'
require 'bundler/setup'
require 'esv_client'

ROOTPATH = File.expand_path('..', __FILE__) unless defined?(ROOTPATH)

Dir[File.join(ROOTPATH, 'support/**/*.rb')].each { |support| require support }

RSpec.configure do |config|
  config.extend VCR::RSpec::Macros
end




