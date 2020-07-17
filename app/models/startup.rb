require_relative './venture_capitalist'
require_relative './funding_round'
class Startup
    
    attr_accessor :name,:domain
    attr_reader :founder
    attr_writer :pivot
    @@all=[]
    @@domain=[]
    def initialize(name,founder,domain)
        @name=name
        @founder=founder
        @domain=domain
        @@all<<self
        @@domain<<domain
    end

    def pivot(new_domain,new_name)
        self.domain = new_domain  
        self.name = new_name
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder_name)
        all_com=Startup.all
        index = all_com.find_index {|value|
            value.founder==founder_name
        }
        all_com[index]
    end

    def self.domains
        @@domain.uniq
    end

    def sign_contract(venture,type,amount)
        @venture = venture
        fund1=FundingRound.new(type,amount)
    end

    def num_funding_rounds
        FundingRound.all.length
    end

    def total_funds
       total=FundingRound.investments.sum
    end

end
