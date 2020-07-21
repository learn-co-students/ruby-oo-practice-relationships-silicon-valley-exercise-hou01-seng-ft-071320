require 'bundler/setup'
Bundler.require
require_rel '../app'


poke_world = Startup.new("PokeWorld","pikachu","Poke.com")
disney = Startup.new("Disney","Walt","Disney.com")
amazon = Startup.new("Amazon","Bezos","Amazon.com")
john = VentureCapitalist.new("John", 7000000)
spencer = VentureCapitalist.new("Spencer", 2000000000)
meghann = VentureCapitalist.new("Meghann", 3000000000)

poke_world.sign_contract(john,"Angel",2000000)
disney.sign_contract(john,"Seed",3000000)
amazon.sign_contract(spencer, "Angel",2000000)
amazon.sign_contract(meghann, "Seed", 1000000)
disney.sign_contract(spencer, "Seed", 3000000)
poke_world.sign_contract(meghann,"Angel",4000000)
disney.sign_contract(spencer, "Angel", 2000000)
