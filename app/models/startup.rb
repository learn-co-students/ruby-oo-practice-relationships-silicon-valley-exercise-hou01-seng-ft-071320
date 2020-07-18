require 'pry'
class Startup
    attr_accessor :name, :domain, :funding_round
    attr_reader :founder
    @@all = []

    def initialize(startup_name,founder,domain)
        @name = startup_name
        @founder = founder
        @domain = domain
        Startup.all << self
        self
    end

    def pivot(new_domain,new_name)
        @domain = new_domain
        @name = new_name
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder_name)
        @@all.find do |index| index.founder == founder_name
            return index.name
        end
    end

    def self.domains
        @@all.map do |index| index.domain
        end
    end

    def sign_contract(vc,inv_type,inv_amt)
        FundingRound.new(self,vc,inv_type,inv_amt)
    end

    def funding_rounds_startup
        FundingRound.all.find_all{|index| index.startup == self }
    end

    def num_funding_rounds
        funding_rounds_startup.length
    end

    def total_funds
        funding_rounds_startup.sum {|index| index.amt}
    end

    def investors
        funding_rounds_startup.map{|index| index.vc}.uniq
    end

    def big_investors
        FundingRound.all.find_all{|index| index.startup == self && index.vc.total_worth>1000000000}
        .map{|index| index.vc}.uniq
    end
end




