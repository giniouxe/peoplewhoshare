module Places
  # Handles the places creation and edition form logic.
  class PlaceForm

    ALLOWED_ATTRIBUTES = %i[name description address city zipcode country].freeze
    private_constant(:ALLOWED_ATTRIBUTES)

    extend ActiveModel::Naming
    include ActiveModel::Conversion

    delegate(
      :name,
      :description,
      :address,
      :city,
      :zipcode,
      :country,
      :persisted?,
      :errors,
      to: :@place
    )

    attr_reader :place

    def initialize(place)
      @place = place
    end

    def attributes=(params)
      place.attributes = params.permit(*ALLOWED_ATTRIBUTES)
    end

  end
end
