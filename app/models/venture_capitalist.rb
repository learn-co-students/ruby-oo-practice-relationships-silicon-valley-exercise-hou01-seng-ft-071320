require 'pry'
class VentureCapitalist
    attr_accessor :name, :total_worth
    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
     @@all
    end

    def self.tres_commas_club
        @@all.find_all {|i| i.total_worth > 1000000}
    end

    def offer_contract(startup,inv_type,inv_amt)
        FundingRound.new(startup,self,inv_type,inv_amt)
    end

    def funding_rounds
        FundingRound.all.find_all{|index| index.vc == self }
    end

    def portfolio
        funding_rounds.map{|index| index.startup}.uniq
    end

    def biggest_investment
        funding_rounds.max_by {|index| index.amt}
        binding.pry
    end

    def invested(domain)
        FundingRound.all.find_all{|index| index.startup.domain == domain}
        .sum{|index| index.amt}
    end
end

