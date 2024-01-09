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

    describe '#tall_enough?' do
        it "establishes if visitor meets required height" do
            expect(@visitor1.tall_enough?(54)).to be(true)
            expect(@visitor2.tall_enough?(54)).to be(false)
            expect(@visitor3.tall_enough?(54)).to be(true)
            expect(@visitor1.tall_enough?(64)).to be(false)
        end 
    end



#=> true

#=> false

#=> true

#=> false
end
