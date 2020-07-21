require 'pry'
class FundingRound
    attr_reader :startup, :vc, :type, :amt
    @@all = []

    def initialize(startup,vc,type,amt)
        @startup = startup
        @vc = vc
        @type = type
        @amt = amt
        @@all << self
    end

    def investment
        FundingRound.all.sum do |index| index.funding_round
        end
    end

    def self.all
        @@all
    end
end
