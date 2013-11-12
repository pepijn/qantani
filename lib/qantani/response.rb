module Qantani
  class Response
    def initialize(data)
      @data = data
    end

    # Banks
    def banks
      data['Banks']['Bank']
    end

    # Execute
    def transaction_id
      data['Response']['TransactionID']
    end

    def transaction_code
      data['Response']['Code']
    end

    def bank_url
      data['Response']['BankURL']
    end

    # Check
    def paid?
      data["Transaction"]["Paid"] == "Y"
    end

    private

    attr_reader :data
  end
end


