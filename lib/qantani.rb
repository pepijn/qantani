require 'httparty'
require 'builder'
require 'active_support/core_ext/hash'

require 'qantani/response'
require 'qantani/request'
require 'qantani/bank'

module Qantani
  API_ENDPOINT = 'https://www.qantanipayments.com/api/'
  DEFAULT_CURRENCY = 'EUR'

  REQUEST_SETTINGS = :merchant_id, :merchant_key
  SETTINGS = REQUEST_SETTINGS + [:merchant_secret]

  def self.config(settings)
    for setting in SETTINGS
      value = settings[setting.to_sym]
      raise ConfigError, "config setting '#{setting}' missing" if value.nil?

      class_variable_set '@@' + setting.to_s, value
    end
  end

  def self.merchant_id
    @@merchant_id
  end

  def self.merchant_key
    @@merchant_key
  end

  def self.merchant_secret
    @@merchant_secret
  end

  def self.banks
    request = Request.new action: "IDEAL.GETBANKS"

    request.response.banks.map { |b| Bank.new(b['Id'], b['Name']) }
  end

  def self.execute(amount: nil, bank_id: nil, description: nil, return_url: nil)
    Request.new action: "IDEAL.EXECUTE",
      parameters: {
        Amount: amount.to_s,
        Bank: bank_id,
        Currency: DEFAULT_CURRENCY,
        Description: description,
        Return: return_url
      }
  end

  def self.check(transaction_id: nil, transaction_code: nil)
    Request.new action: "TRANSACTIONSTATUS",
      parameters: {
        TransactionCode: transaction_code,
        TransactionID: transaction_id
      }
  end

  # The common base class for all exceptions raised by OmniKassa
  class QantaniError < StandardError
  end

  # Raised if something is wrong with the configuration parameters
  class ConfigError < QantaniError
  end
end

#require 'qantani/response'

