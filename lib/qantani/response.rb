module Qantani
  class Response
    def initialize(body)
      @body = body
    end

    # Banks
    def banks
      body['Banks']['Bank']
    end

    # Execute
    def transaction_id
      body['Response']['TransactionID']
    end

    def transaction_code
      body['Response']['Code']
    end

    def bank_url
      body['Response']['BankURL']
    end

    # Check
    def paid?
      body["Transaction"]["Paid"] == "Y"
    end

    private

    attr_reader :body
  end
end


