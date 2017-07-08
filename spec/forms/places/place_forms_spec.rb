require 'rails_helper'

RSpec.describe Places::PlaceForm do
  let(:place) { Place.new }
  let(:form) { described_class.new(place) }

  describe '#attributes=' do
    subject(:set_attributes) { form.attributes = attributes }

    context 'when the attributes are allowed' do
      let(:attributes) { ActionController::Parameters.new(FactoryGirl.attributes_for(:place)) }

      it 'sets the attributes' do
        set_attributes
        expect(form.place.name).to eq(attributes[:name])
        expect(form.place.description).to eq(attributes[:description])
        expect(form.place.address).to eq(attributes[:address])
        expect(form.place.city).to eq(attributes[:city])
        expect(form.place.zipcode).to eq(attributes[:zipcode])
        expect(form.place.country).to eq(attributes[:country])
      end
    end

    context 'when an attributes is not allowed' do
      let(:attributes) { ActionController::Parameters.new(created_at: 1.day.ago) }

      it 'does not set the attributes' do
        set_attributes
        expect(form.place.updated_at).not_to eq(attributes[:created_at])
      end
    end
  end
end
