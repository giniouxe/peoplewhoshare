require 'rails_helper'

RSpec.describe Places::GeocodePlace do
  subject(:run) { described_class.run(place) }
  before(:all) do
    @latitude = 51.46370535
    @longitude = -3.16412444820515
    Geocoder::Lookup::Test.set_default_stub(
      [{ 'latitude' => @latitude, 'longitude' => @longitude }]
    )
  end

  context 'when the full address is empty' do
    let(:place) { Place.new }

    it 'does not geocode the place' do
      expect(place).not_to receive(:geocode)
      run
    end
  end

  context 'when the location has not changed' do
    let(:place) { FactoryGirl.build_stubbed(:place) }

    it 'does not geocode the place' do
      expect(place).not_to receive(:geocode)
      run
    end
  end

  context 'when the location has changed' do
    let(:place) { FactoryGirl.build(:place) }

    it 'finds the latitude of the place' do
      expect { run }
        .to change(place, :to_coordinates)
        .from([nil, nil]).to([@latitude, @longitude])
    end
  end
end
