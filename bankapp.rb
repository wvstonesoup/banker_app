require_relative 'multiply.rb'
require 'sinatra'

get '/' do 
	erb :getname
end

post '/name' do
	name = params[:user_name]
	redirect '/amount?user_name=' + name
end

get '/amount' do
	name = params[:user_name]
	erb :getamount, :locals => {:name => name}
end

post '/amount' do
	amount = params[:user_amt]
	name = params[:user_name]
	number = multiply(amount.to_i, 4)

"Okay #{name}. I think we can give you #{amount} dollars in change. That equals #{number} quarters." 
	
end

