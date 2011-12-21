require 'spec_helper'

describe 'Version' do
  it "should follow the correct versioning style" do
    ::EsvClient::VERSION.should match(/\d{1,2}\.\d{1,2}\.\d{1,2}/)
  end
end
