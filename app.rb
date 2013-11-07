require 'qantani'
require './test_settings'

enable :sessions

get '/' do
  Qantani.banks.inspect
end

get '/check' do
  request = Qantani.check(
    transaction_id: params[:id],
    transaction_code: session[:transaction_code]
  )

  request.response.inspect
end

get '/:amount' do
  payment = Qantani.execute(
    amount: params[:amount],
    bank_id: 'ING',
    return_url: 'http://localhost:9393/check',
    description: 'Testje'
  )

  session[:transaction_code] = payment.transaction_code
  redirect payment.bank_url
end

