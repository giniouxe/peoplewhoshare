# Place where people share some stuffs and services
class Place < ActiveRecord::Base

  # Validations
  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :zipcode, presence: true
  validates :country, presence: true, length: { minimum: 2 }

  # Assuming country_select is used with Place attribute `country`,
  # this will attempt to translate the country name and use the default
  # (usually English) name if no translation is available
  def country_name
    country = ISO3166::Country[self.country]
    country.translations[I18n.locale.to_s] || country.name
  end
end
