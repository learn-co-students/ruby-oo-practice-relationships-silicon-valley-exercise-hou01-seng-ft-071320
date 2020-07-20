require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console



apple = Startup.new("apple", "Tom Lai", "Tech")
google = Startup.new("google", "Daniel Cole", "Tech")
amazon = Startup.new("amazon", "Shivang Dave", "OnlineRetail")

angelo = VentureCapitalist.new("Angelo", 999999999)
benjamin = VentureCapitalist.new("Benjamin", 5000000000)
joshua = VentureCapitalist.new("Joshua", 3000000000)

# funding_round_1 = FundingRound.new("apple", "Angelo", "angel", 100000)
# funding_round_2 = FundingRound.new("google", "Benjamin", "seed", 999999)
# funding_round_3 = FundingRound.new("amazon", "Joshua", "Pre-seed", 999999)
# funding_round_4 = FundingRound.new("apple", "Benjamin", "angel", 100000)
# funding_round_5 = FundingRound.new("apple", "Angelo", "angel", 200000)
# funding_round_5 = FundingRound.new("apple", "Joshua", "angel", 300000)
# funding_round_5 = FundingRound.new("apple", "Benjamin", "angel", 300000)
# funding_round_6 = FundingRound.new("amazon", "Angelo", "Pre-seed", 999999)

contract1 = angelo.offer_contract(apple, "angel", 1000000)
contract2 = angelo.offer_contract(google, "angel", 1000000)
contract3 = angelo.offer_contract(amazon, "angel", 1000000)
contract4 = angelo.offer_contract(apple, "pre-seed", 1000000)
contract5 = benjamin.offer_contract(apple, "seed", 1000000)
contract6 = joshua.offer_contract(apple, "seed", 1000000)
contract6 = joshua.offer_contract(amazon, "seed", 1000000)








binding.pry
0 #leave this here to ensure binding.pry isn't the last line