require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
st1 = Startup.new("Microsoft", "Bill Gates","Tech")
st2 = Startup.new("Amazon", "Jeff Bezos","Retail")
st3 = Startup.new("Tesla", "Elon", "Automotive")
st4 = Startup.new("Myspace", "Tom", "Tech")

vc1 = VentureCapitalist.new("Bob", 20000000)
vc2 = VentureCapitalist.new("Alice", 5000000000)
vc3 = VentureCapitalist.new("Jetta", 2000)
vc4 = VentureCapitalist.new("Monopoly Man", 69000000000)

#fr1 = FundingRound.new("Microsoft", "Bob", "2000", "Angel")
#fr2 = FundingRound.new("Tesla", "Alice", "5000000", "Seed")
#fr3 = FundingRound.new("Myspace", "Jetta", "60", "Phase-1")
#fr4 = FundingRound.new("Tesla", "Monopoly Man", "20000000", "Seed")

sc1 = st1.sign_contract(vc1, "Angel", 2000.0)
sc2 = st3.sign_contract(vc2, "Seed", 5000000.0)
sc3 = st4.sign_contract(vc3, "Phase-1", 60.0)
sc4 = st3.sign_contract(vc4, "Seed", 3000.0)
sc5 = st4.sign_contract(vc4, "Seed", 5000.0)

oc1 = vc3.offer_contract(st4, "Angel", 400000)
oc1 = vc3.offer_contract(st1, "Angel", 500000)


#Startup.find_by_founder("Jeff Bezos")
#test1.pivot("this is domain")
binding.pry
0 #leave this here to ensure binding.pry isn't the last line