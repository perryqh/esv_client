$:.unshift File.expand_path('..', __FILE__)
$:.unshift File.expand_path('../../lib', __FILE__)

require 'rubygems'
require 'bundler/setup'
require 'esv_client'
require 'pry'

ROOTPATH = File.expand_path('..', __FILE__) unless defined?(ROOTPATH)

Dir[File.join(ROOTPATH, 'support/**/*.rb')].each { |support| require support }

RSpec.configure do |config|
  config.extend VCR::RSpec::Macros
end

TEST_ESV_KEY = ENV['ESV_API_KEY']
EsvClient::Client.configure do |conf|
  conf.esv_key = TEST_ESV_KEY
end




