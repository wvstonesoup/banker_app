require 'sinatra'
require_relative 'add_func.rb'
require_relative 'minus_func.rb'
require_relative 'coinbank.rb'


get '/' do 
	erb :getname2
end

post '/name' do
	name = params[:user_first_name]
	redirect '/amount2?user_name=' + name
end

get '/amount2' do
	name = params[:user_name]
	erb :getamount2, :locals => {:name => name}
end

post '/amount2' do
	name = params[:user_name]
	dollars = params[:user_pymnt_dollars]
	cents = params[:user_pymnt_cents]
	payment = add(dollars*100, cents)
	redirect '/tender?user_name=' + name + '&payment=' + payment
end

get '/tender' do 
	name = params[:user_name]
	dollars2 = params[:user_tndr_dollars]
	cents2 = params[:user_tndr_cents]
	tendered = add(dollars2*100, cents2)
	change = minus(tendered, payment)
	result = coinbank
	erb :tendered, :locals => {:name => name}

"So, #{name}, you gave me $#{dollars2}.#{cents2} for your payment of $#{dollars}.#{cents} and your change is #{result}." 
end



