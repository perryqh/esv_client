require 'spec_helper'

describe EsvClient::Client do
  describe 'search' do
    use_vcr_cassette :record => :all

    let(:client) { EsvClient::Client.new }
    let(:search_string) { "John 1:12-13" }

    it "should successfully search" 
  end
end

