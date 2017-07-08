require 'rails_helper'

RSpec.describe Places::CreateOrUpdatePlace do
  describe '.run' do
    subject(:run) { described_class.run(place) }

    context 'on creation' do
      let(:place) { FactoryGirl.build(:place) }

      it 'creates a place' do
        expect { run }.to change(Place, :count).by(1)
      end

      context 'when the place is invalid' do
        let(:place) { FactoryGirl.build(:place, name: nil) }

        it 'does not create a place' do
          expect { run }.not_to change(Place, :count)
        end
      end
    end

    context 'on update' do
      let(:place) { FactoryGirl.create(:place, name: 'Old name') }

      before { place.name = 'New name' }

      it 'updates the place' do
        run
        expect(place.reload.name).to eq('New name')
      end

      context 'when the place is invalid' do
        before { place.name = nil }

        it 'updates the place' do
          run
          expect(place.reload.name).to eq('Old name')
        end
      end
    end
  end
end
