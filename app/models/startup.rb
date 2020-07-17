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

end
