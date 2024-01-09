
class Ride 
    attr_reader :name, :min_height, :admission_fee, :excitement, :total_revenue

    def initialize(attributes)
        @name = attributes[:name]
        @min_height = attributes[:min_height]
        @admission_fee = attributes[:admission_fee]
        @excitement = attributes[:excitement]
        @total_revenue = 0
        @riders = Hash.new(0)
    end

    def board_rider(visitor)
        return unless visitor.tall_enough?(@min_height)

        visitor_cash= visitor.spending_money - @admission_fee

        return if visitor_cash < 0     

        @riders[visitor] += 1
        @total_revenue += @admission_fee
        visitor.spending_money = visitor_cash
    end

    def rider_log
        @riders
    end

    def total_revenue
        @total_revenue
    end
end