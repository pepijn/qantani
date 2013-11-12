require 'qantani'
require './test_settings'

enable :sessions

get '/' do
  Qantani.banks.map { |b| { b.id => b.name } }.inspect
end

get '/check' do
  check = Qantani.check(
    transaction_id: params[:id],
    transaction_code: session[:transaction_code]
  )

  "#{check.inspect}<br><br>Paid: #{check.paid?}"
end

get '/:amount' do
  payment = Qantani.execute(
    amount: params[:amount],
    bank_id: 'ING',
    return_url: 'http://localhost:9393/check',
    description: 'Testbetaling 123'
  )

  session[:transaction_code] = payment.transaction_code
  redirect payment.bank_url
end

