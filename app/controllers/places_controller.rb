class PlacesController < ApplicationController

  def show
    @place = Place.find(params[:id])
  end

  def new
    @form = Places::PlaceForm.new(Place.new)
  end

  def create
    @form = Places::PlaceForm.new(Place.new)

    @form.attributes = params[:places_place_form]

    if Places::CreateOrUpdatePlace.run(@form.place)
      flash[:success] = 'Congratulations'
      redirect_to root_path, success: t('.create_place_success')
    else
      flash[:error] = t('.create_place_failure')
      render :new
    end
  end

  def edit
    place = Place.find(params[:id])
    @form = Places::PlaceForm.new(place)
  end

  def update
    place = Place.find(params[:id])
    @form = Places::PlaceForm.new(place)
    @form.attributes = params[:places_place_form]

    if Places::CreateOrUpdatePlace.run(@form.place)
      flash[:notice] = 'Good to go!'
      redirect_to place_path(place)
    else
      flash[:error] = 'Gush!'
      render :edit
    end
  end

end
