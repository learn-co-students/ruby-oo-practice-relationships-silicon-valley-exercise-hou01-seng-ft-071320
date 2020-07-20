require 'pry'

class Startup
    
    attr_accessor :name
    attr_reader :founder, :domain

    @@all_startups = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        self.class.all << self

    end

    def pivot(domain, name)
        self.domain= domain
        self.name = name
        self
    end

    def self.all 
        @@all_startups
    end

    def self.find_by_founder(founder_lookup)
        self.all.find {|startups| startups.founder == founder_lookup}
    end

    def self.domains
        self.all.map {|startups| startups.domain}
        # domain_array = []
        # i = 0
        # while i < self.all.length
        #     domain_array << self.all[i].domain
        #     i +=1
        # end
        # domain_array
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def funding_rounds
        FundingRound.all.select {|fr| fr.startup == self.name}.length
        # funding_array = FundingRound.all.select {|fr| fr.startup == startup}
        # funding_array.length
    end

    def total_funds
        FundingRound.all.select {|fr| fr.startup == self.name}.map {|fr2| fr2.investment}.inject(0){|sum,i| sum + i }
        # funding_array = FundingRound.all.select {|fr| fr.startup == self.name}
        # funding_array.map {|fr2| fr2.investment}.inject(0){|sum,i| sum + i }
    end

    def investors
        FundingRound.all.select {|fr| fr.startup == self.name}.map {|fr2| fr2.venture_capitalist}.uniq
    end

    def big_investors
        bi_array = self.investors
        tc_array = VentureCapitalist.tres_commas_club.map {|vc| vc.name}
        bi_array.delete((bi_array-tc_array).join)
        bi_array
    end

    private

    def domain= (domain)
        @domain = domain
    end
end



