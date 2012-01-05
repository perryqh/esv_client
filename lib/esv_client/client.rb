module EsvClient
  class Client
    extend ::EsvClient::Configuration

    attr_accessor :passage

    def initialize(passage)
      self.passage = passage
    end

    def search
      RestClient.get "#{Client.configuration.esv_query_url}?#{options_string}"
    end

    private
    def options_string
      hash_to_options_string({key: Client.configuration.esv_key, passage: sanitize_passage}.merge(Client.configuration.options))
    end

    def hash_to_options_string(hash)
      hash.collect do |key, value|
        "#{key.to_s.gsub('_', '-')}=#{value}"
      end.join('&')
    end

    def sanitize_passage
      passage.gsub(/\s/, "+").gsub(/\:/, "%3A").gsub(/\,/, "%2C")
    end
  end
end
