require_relative './startup'
require_relative './funding_round'
class VentureCapitalist
    attr_accessor :name,:total_worth

    @@all=[]
    @@names=[]
    def initialize(name,total_worth)
        @name=name
        @total_worth=total_worth
        @@all<<self
        @@names<<name
    end
    
    def self.all
        @@all
    end
    def self.names
        @@names
    end

    def self.tres_commas_club
        all_ven=VentureCapitalist.all
        club = []
        club = all_ven.find_all {|value|
            value.total_worth > 1000000000
        }        
       club
    end

    def offer_contract(type,amount)
        FundingRound.new(type,amount)
    end

    def funding_rounds
       
    end
    def investors
        VentureCapitalist.names
    end
    def big_investors
        VentureCapitalist.tres_commas_club
    end

end

