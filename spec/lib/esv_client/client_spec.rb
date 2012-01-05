require 'spec_helper'

describe EsvClient::Client do
  let(:client) { EsvClient::Client.new(search_string) }
  let(:search_string) { "John 1:12-13" }

  describe 'search' do
    use_vcr_cassette :record => :once
    let(:search_result) { client.search }

    specify { search_result.should match(/John 1:12-13/) }
    specify { search_result.should match(/But to all who did receive him/) }
  end

  describe 'options_string' do
    it "should send correct hash to hash_to_options_string" do
      client.should_receive(:hash_to_options_string).with(hash_including(key: EsvClient::Client.configuration.esv_key, passage: client.send(:sanitize_passage)))
      client.send(:options_string)
    end
  end

  describe 'hash_to_options_string' do
    specify { client.send(:hash_to_options_string, foo: 'bar', bazzle_zazzle: 'wow').should == "foo=bar&bazzle-zazzle=wow" }
  end

  describe 'sanitize passage' do
    [["John 1:12-13", "John+1%3A12-13"], ["Matthew 2:3,4", 'Matthew+2%3A3%2C4']].each do |passage_array|
      it "should sanitize '#{passage_array.first}'" do
        client.passage = passage_array.first
        client.send(:sanitize_passage).should == passage_array.last
      end
    end
  end
end

