require 'rails_helper'

RSpec.describe PlacesController do
  let(:place) { FactoryGirl.create(:place, name: 'Torchwood') }

  describe 'GET #show' do
    subject(:show) { get :show, id: place }

    it 'returns success' do
      show
      expect(response).to be_success
    end
  end

  describe 'GET #new' do
    it 'returns success' do
      get :new
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    let(:attributes) { FactoryGirl.attributes_for(:place) }
    subject(:create) { post :create, places_place_form: attributes }

    it 'creates a new place' do
      expect { create }.to change(Place, :count).by(1)
    end

    it 'redirects to the homepage' do
      create
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'GET #edit' do
    subject(:edit) { get :edit, id: place }

    it 'returns success' do
      edit
      expect(response).to be_success
    end
  end

  describe 'PATCH #update' do
    let(:attributes) { { name: 'TARDIS' } }
    subject(:update) { post :update, id: place, places_place_form: attributes }

    it 'updates the place' do
      update
      expect(place.reload.name).to eq(attributes[:name])
    end

    it 'redirects to #show' do
      update
      expect(response).to redirect_to(place_path(place))
    end

    context 'when the attributes are invalid' do
      let(:attributes) { { name: nil } }

      it 'does not update the place' do
        update
        expect(place.reload.name).not_to be_nil
      end

      it 'renders edit' do
        update
        expect(response).to render_template(:edit)
      end
    end
  end
end
