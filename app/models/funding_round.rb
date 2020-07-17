require_relative './startup'
require_relative './venture_capitalist'
class FundingRound
    attr_accessor :type,:investment
     attr_reader :startup,:venture_capitalist
 
     @@all=[]
 
     def initialize(type,investment)
         @type=type
         @investment=investment
         @investment>0
         @@all << self
     end
 
     def startup
         self.startup
     end
     def venture_capitalist
         self.venture_capitalist
     end
     def type
         @type
     end
     def investment
         @investment
     end
 
     def self.all
         @@all
     end
 end
