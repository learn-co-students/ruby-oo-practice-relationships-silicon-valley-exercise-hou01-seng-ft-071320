require 'pry'

class Startup   
    attr_accessor  :domain, :name
    attr_reader :founder, :funding_rounds
    @@all = []
    def initialize(name,founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @funding_rounds = []
        @@all << self
    end
   
    def pivot (domain = @domain, name = @name)
        @domain = domain
        @name = name
    end
    def self.all
        @@all
    end
    def self.find_by_founder(founder)
        all.find do |startup|
            founder == startup.founder
            #binding.pry
        end
        #binding.pry
    end
    def self.domains
        domains = []
        all.each do |startup|
            domains << startup.domain
            #binding.pry
        end
        #binding.pry
        domains.uniq
    end

    def sign_contract(vc, inv_type, amount)
        new_contract = FundingRound.new(name, vc.name, amount.to_f, inv_type)
        @funding_rounds << new_contract

    end

    def num_funding_rounds
        funding_rounds.count
    end    

    def total_funds
        total_funds = 0
        funding_rounds.each do |rounds|
            total_funds += rounds.amount
        end
        total_funds
    end  
    
    def investors
        @investor_list = []
        funding_rounds.each do |rounds|
            @investor_list << rounds.vc
        end
        @investor_list.uniq
    end

    def big_investors
        ballers = []
        VentureCapitalist.tres_commas_club.each do |baller|
            #binding.pry
            investors.each do |investor|
                if baller.vc_name == investor
                    ballers << baller.vc_name
                end
            end
        end
        ballers.uniq
    end

    private
    attr_writer :founder
end

