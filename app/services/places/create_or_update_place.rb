module Places
  # Logic around the creation and edition of a place.
  class CreateOrUpdatePlace

    def self.run(place)
      new(place).run
    end

    def initialize(place)
      @place = place
    end

    def run
      @place.save
    end

  end
end
