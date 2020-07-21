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
        self.all.find { |startup| startup.founder == name }
    end

    def self.domains
        @@domain.uniq
    end

    def sign_contract(type,amount,venture)
        FundingRound.new(type,amount.self,venture)
    end
  
    def num_funding_rounds
        arr=FundingRound.all.find{|value|
        value.startuo==self}
        arr.size
    end

    def total_funds
        arr=FundingRound.all.find{|value|
        value.startup==self}
        amount = arr.map{|ele|ele.amount}
        amount.sum
    end
    def investors
        arr=FundingRound.all.find{|value|
        value.startup==self}
        vent = arr.map{|ele|ele.venture_capitalist}
        vent.uniq
    end
    def big_investors
        arr=FundingRound.tres_commas_club.find{|value|
        value.startup==self}
    end

end
