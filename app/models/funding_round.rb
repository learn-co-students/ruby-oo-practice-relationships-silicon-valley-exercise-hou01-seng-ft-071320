class FundingRound
    attr_accessor :vc, :amount, :type 
    attr_reader :startup
    @@all = []
    def initialize(startup, vc, amount, type)
        @startup =startup
        @vc = vc
        @amount = amount
        @type = type

        @@all << self
    end

    def type
        @type
    end

    def self.all
        @@all
    end

    private
    attr_writer :startup

end
