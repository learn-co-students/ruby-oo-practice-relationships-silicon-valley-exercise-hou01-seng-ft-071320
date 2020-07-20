require 'pry'

class VentureCapitalist
    attr_accessor :vc_name , :worth
    @@all = []
    def initialize(vc_name, worth)
        @vc_name = vc_name
        @worth = worth
        @@all << self
        @all_contracts = []
    end    
    
    def name
         @vc_name    
    end

    def total_worth
        @worth
    end    

    def self.all
        @@all
    end

    def self.tres_commas_club
        tc_club = all.select { |vc| vc.worth >= 1000000000} 
    end

    def offer_contract(startup, inv_type, amount)
        new_contract = FundingRound.new(startup.name, name, amount, inv_type)
        @all_contracts << new_contract
        new_contract
    end
    
    def funding_rounds
        @all_contracts
    end

    def portfolio
        funded_companies = []
        funding_rounds.each do |contract|
            funded_companies << contract.startup
        end
        funded_companies.uniq
    end

    def biggest_investment
        biggest_amount = 0
        biggest_contract = []
        funding_rounds.each do |contract|
            if contract.amount > biggest_amount
                biggest_contract = contract
            end
        end
        biggest_contract
    end

    def invested(domain)
        domain_investments = []
        Startup.all.each do |company|
            if company.domain == domain
                domain_investments << company.name
            end
        end
        domain_investments
        invested_total = 0
        domain_investments.each do |comp|
            funding_rounds.each do |round|
                if comp = round.startup
                    invested_total += round.amount
                end
            end
        end
        invested_total
    end

end

