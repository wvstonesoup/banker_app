def coins_in_change(cents_received) 
 	coins = {}

 	money = {:half_dollar => 50, :quarter => 25, :dime => 10, :nickel => 5, :penny => 1}
 	money.each do |coin_type, coin_value|

 		if cents_received >= coin_value
  			coins[coin_type] = cents_received / coin_value
 			cents_received = cents_received % coin_value
 		end
 	end