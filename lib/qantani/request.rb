module Qantani
  class Request
    # Qantani API version
    API_VERSION = 1

    attr_accessor :action, :parameters
    attr_reader :response

    def initialize(attrs)
      attrs.each do |key, value|
        send key.to_s + '=', value
      end

      request = HTTParty.post API_ENDPOINT, body: { data: xml }, format: :xml
      @response = Response.new request.parsed_response['Response']
    end

    def parameters
      @parameters || {}
    end

    def xml
      request_data.to_xml root: 'Transaction'
    end

    def request_data
      {
        Action: {
          Name: action,
          Version: API_VERSION
        },
        Parameters: parameters,
        Merchant: {
          ID: Qantani.merchant_id,
          Key: Qantani.merchant_key,
          Checksum: checksum
        }
      }
    end

    def checksum
      Digest::SHA1.new.update parameters.values.join + Qantani.merchant_secret
    end
  end
end

