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
  response = request.response

  "#{response.inspect}<br><br>Paid: #{response.paid?}"
end

get '/:amount' do
  payment = Qantani.execute(
    amount: params[:amount],
    bank_id: 'ING',
    return_url: 'http://localhost:9393/check',
    description: 'Testbetaling 123'
  )
  response = payment.response

  session[:transaction_code] = response.transaction_code
  redirect response.bank_url
end

