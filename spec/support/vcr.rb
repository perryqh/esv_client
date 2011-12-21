require 'vcr'

VCR.config do |c|
  c.cassette_library_dir     = File.expand_path('../../fixtures/cassette_library', __FILE__)
  c.stub_with                :fakeweb
  c.ignore_localhost         = true
  c.default_cassette_options = { :record => :none }
end
