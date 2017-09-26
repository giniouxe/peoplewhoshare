module Places
  # Service to geocode a place by its latitude and longitude
  class GeocodePlace
    def self.run(place)
      new(place).run
    end

    def initialize(place)
      @place = place
    end

    def run
      return unless address_is_present? && address_has_changed?
      @place.geocode
      @place
    end

    private

    def address_is_present?
      @place.full_address.present?
    end

    def address_has_changed?
      @place.address_changed? ||
        @place.city_changed? ||
        @place.country_changed? ||
        @place.zipcode_changed?
    end
  end
end
