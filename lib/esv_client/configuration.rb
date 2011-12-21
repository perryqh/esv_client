require 'singleton'

module EsvClient
  module Configuration
    def configure
      yield(configuration)
    end

    def configuration
      Config.instance
    end

    class Config
      include Singleton

      attr_accessor :options, :esv_query_url, :esv_key

      def initialize
        set_defaults
      end

      private
      def set_defaults
        self.options = {
          :include_passage_references => true,
          :include_footnotes => false,
          :include_headings => false,
          :include_subheadings => false,
          :include_audio_link => true,
          :include_short_copyright => true,
          :incude_passage_horizontal_lines => false,
          :include_heading_horizontal_lines => false
        }
        self.esv_query_url = "http://www.esvapi.org/v2/rest/passageQuery"
      end
    end
  end
end
