require 'pry'

class VentureCapitalist

    attr_accessor :name, :total_worth

    @@all_venture_capitalists = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        self.class.all << self
    end

    def self.all
        @@all_venture_capitalists
    end

    def self.tres_commas_club
        self.all.find_all {|v| v.total_worth > 1000000000}
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select {|fr| fr.venture_capitalist == self.name}
    end
    
    def portfolio
        FundingRound.all.select {|fr| fr.venture_capitalist == self.name}.map {|fr2| fr2.startup}.uniq
    end

    def biggest_investment
        FundingRound.all.select {|fr| fr.venture_capitalist == self.name}.map {|fr2| fr2.investment}.max
    end

    def invested(domain)
        array1 = FundingRound.all.select {|fr| fr.venture_capitalist == self}
        array2 = array1.select {|fr2| fr2.startup.domain == domain}
        array2.map {|fr3| fr3.investment}.sum
    end

end
