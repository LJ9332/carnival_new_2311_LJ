require 'spec_helper'

RSpec.describe Visitor do
    before(:each) do
        @visitor1 = Visitor.new('Bruce', 54, '$10')
        @visitor2 = Visitor.new('Tucker', 36, '$5')
        @visitor3 = Visitor.new('Penny', 64, '$15')

        expect(@visitor1 = Visitor.new('Bruce', 54, '$10')).to be_a(Visitor)
        expect(@visitor2 = Visitor.new('Tucker', 36, '$5')).to be_a(Visitor)
        expect(@visitor3 = Visitor.new('Penny', 64, '$15')).to be_a(Visitor)
    end
        
    describe '#initialize' do
        it 'can initialize visitor' do
            expect(@visitor1.name).to eq("Bruce")
            expect(@visitor1.height).to eq(54)
            expect(@visitor1.spending_money).to eq(10)
            expect(@visitor1.preferences).to eq([]) 
        end
    end

    describe '#add_preference' do
        it "adds new preference to empty array" do
            @visitor1.add_preference(:gentle)
            @visitor1.add_preference(:thrilling)
            
            expect(@visitor1.preferences).to eq([:gentle, :thrilling])
        end
    end




#=> [:gentle, :thrilling]

#=> #<Visitor:0x000000012f1f30f8 @height=36, @name="Tucker", @preferences=[], @spending_money=5>

#=> #<Visitor:0x000000012f176760 @height=64, @name="Penny", @preferences=[], @spending_money=15>

@visitor1.tall_enough?(54)
#=> true

@visitor2.tall_enough?(54)
#=> false

@visitor3.tall_enough?(54)
#=> true

@visitor1.tall_enough?(64)
#=> false
end
