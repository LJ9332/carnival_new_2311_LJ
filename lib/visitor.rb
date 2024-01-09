class Visitor
attr_reader :name, :height, :spending_money, :preferences

    def initialize(name, height, spending_money)
        @name = name
        @height = height
        @spending_money = cash(spending_money)
        @preferences = []
    end

    def cash(money)
        money.gsub('$', '').to_i
    end

    def add_preference
        
    end
end