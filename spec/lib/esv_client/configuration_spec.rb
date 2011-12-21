require 'spec_helper'

class ConfigurationDummy
  extend ::EsvClient::Configuration
end

describe EsvClient::Configuration do
  describe 'defaults' do
    subject { EsvClient::Configuration::Config.instance }

    before(:all) do
      subject.send(:set_defaults)
    end

    specify { subject.options.should == {
        :include_passage_references => true,
        :include_footnotes => false,
        :include_headings => false,
        :include_subheadings => false,
        :include_audio_link => true,
        :include_short_copyright => true,
        :incude_passage_horizontal_lines => false,
        :include_heading_horizontal_lines => false
      } }
    specify { subject.esv_query_url.should  == "http://www.esvapi.org/v2/rest/passageQuery" }
    specify { subject.esv_key.should be_nil }
  end

  describe 'configure' do
    it "should update configuration with block" do
      ConfigurationDummy.configure do |config|
        config.esv_key = 'different'
      end
      EsvClient::Client.configuration.esv_key.should == 'different'
    end
  end
end
