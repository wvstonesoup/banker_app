def coins_in_change(cents_in_change) 
 	coins = {}

 	money = {:ten => 1000, :five => 500, :one => 100, :half_dollar => 50, :quarter => 25, :dime => 10, :nickel => 5, :penny => 1}
 	money.each do |coin_type, coin_value|

 		if cents_in_change >= coin_value
  			coins[coin_type] = cents_in_change / coin_value
 			cents_in_change = cents_in_changec % coin_value
 		end
 		coins
 	end
 end