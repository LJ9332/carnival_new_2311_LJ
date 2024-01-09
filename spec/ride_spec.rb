require 'spec_helper'

RSpec.describe Ride do
    before(:each) do
        @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
        @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
        @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
        @visitor1 = Visitor.new('Bruce', 54, '$10')
        @visitor2 = Visitor.new('Tucker', 36, '$5')
        @visitor3 = Visitor.new('Penny', 64, '$15')

        expect(@ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })).to be_a(Ride)
        expect(@ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })).to be_a(Ride)
        expect(@ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })).to be_a(Ride)
        expect(@visitor1 = Visitor.new('Bruce', 54, '$10')).to be_a(Visitor)
        expect(@visitor2 = Visitor.new('Tucker', 36, '$5')).to be_a(Visitor)
        expect(@visitor3 = Visitor.new('Penny', 64, '$15')).to be_a(Visitor)
    end

    describe '#initialize' do
        it "exists and has attributes" do
            expect(@ride1.name).to eq("Carousel")
            expect(@ride1.min_height).to eq(24)
            expect(@ride1.admission_fee).to eq(1)
            expect(@ride1.excitement).to eq(:gentle)
            expect(@ride1.total_revenue).to eq (0)
        end
    end

    describe '#board_rider' do
      it 'adds the visitor to the ride and updates total revenue' do
        allow(@visitor1).to receive(:tall_enough?).and_return(true)

        expect { @ride1.board_rider(@visitor1) }.to change { @ride1.rider_log[@visitor1] }.from(0).to(1)
        expect(@ride1.total_revenue).to eq(1)
      end    

      it 'does not add the visitor to the ride and does not update total revenue' do
        allow(@visitor2).to receive(:tall_enough?).and_return(false)

        expect { @ride1.board_rider(@visitor2) }.not_to(change { @ride1.rider_log[@visitor2] })
        expect(@ride1.total_revenue).to eq(0)
      end
    end

    describe '#rider_log' do
        it "makes a log of visitors at rides and updates total revenue" do
            @visitor1.add_preference(:gentle)
            @visitor2.add_preference(:gentle)
            
            @ride1.board_rider(@visitor1)
            @ride1.board_rider(@visitor2)
            @ride1.board_rider(@visitor1)

            expect(@ride1.rider_log).to be_a(Hash)
            expect(@visitor1.spending_money).to eq(8)
            expect(@visitor2.spending_money).to eq(4)
            expect(@ride1.total_revenue).to eq(3)
        end
    end

    # describe '#total_revenue' do
    #     it "returns correct total revenue for rides" do
    #         @ride1.board_rider(@visitor1)
    #         @ride1.board_rider(@visitor2)
    #         @ride1.board_rider(@visitor1)

            
    #         expect(@visitor1.spending_money).to eq(8)
    #         expect(@visitor2.spending_money).to eq(4)
    #         expect(@ride1.total_revenue).to eq(3)
    #     end
    # end
 #=> 8
 
 #=> 4
 
 #=> 3
 
#  #=> #<Visitor:0x0000000159a852a0 @height=64, @name="Penny", @preferences=[], @spending_money=15>
 
#  #=> #<Ride:0x0000000159a0cd00 @admission_fee=5, @excitement=:gentle, @min_height=36, @name="Ferris Wheel", @rider_log={}>
 
#  #=> #<Ride:0x0000000159ae7a68 @admission_fee=2, @excitement=:thrilling, @min_height=54, @name="Roller Coaster", @rider_log={}>
 
#  @visitor2.add_preference(:thrilling)
#  #=> [:gentle, :thrilling]
 
#  @visitor3.add_preference(:thrilling)
#  #=> [:thrilling]
 
#  @ride3.board_rider(visitor1)
 
#  @ride3.board_rider(visitor2)
 
#  @ride3.board_rider(visitor3)
 
#  @visitor1.spending_money
#  #=> 8
 
#  @visitor2.spending_money
#  #=> 4
#  @visitor3.spending_money
# #=> 13

# @ride3.rider_log
# #=> {#<Visitor:0x0000000159a852a0 @height=64, @name="Penny", @preferences=[:thrilling], @spending_money=13> => 1}

# @ride3.total_revenue
# #=> 2
end