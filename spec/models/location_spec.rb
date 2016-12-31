require 'rails_helper'

RSpec.describe Location, type: :model do
  context('Three locations 1,5 km away') do
    before do
      @locA = Location.new(lat: 40.741895, lgt: -73.989308)
      @locB = Location.new(lat: 40.740556, lgt: -73.971667)
      @locC = Location.new(lat: 40.739167, lgt: -73.953889)
      @locA.save!
      @locB.save!
      @locC.save!
    end

    describe('within') do
      it('2km from a') do
        result = @locA.within(2)
        expect(result.first.id).to eq(@locB.id)
      end

      it('2km from b') do
        result = @locB.within(2)
        expect(result).to include(@locA, @locC)
      end

      it('1km from b') do
        result = @locB.within(1)
        expect(result).to be_empty
      end
    end

    describe('distance_to') do
      it('is 1.5 km from a') do
        expect(@locB.distance_to(@locA)).to be_within(0.1).of(1.5)
      end

      it('is 3 km from c') do
        expect(@locC.distance_to(@locA)).to be_within(0.1).of(3.0)
      end

      it('has an alias as distance_from') do
        distance_to_result = @locC.distance_to(@locA)
        distance_from_result = @locC.distance_from(@locA)
        expect(distance_to_result).to eq(distance_from_result)
      end
    end
  end
end
