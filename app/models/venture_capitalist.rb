class VentureCapitalist
    attr_accessor :name,:total_worth

    @@all=[]
    def initialize(name,total_worth)
        @name=name
        @total_worth=total_worth
        @@all<<self
    end
    
    def self.all
        @@all
    end

    def self.tres_commas_club
        all_ven=VentureCapitalist.all
        club = []
        club = all_ven.find_all {|value|
            value.total_worth > 1000000000
        }        
       club
    end
end

