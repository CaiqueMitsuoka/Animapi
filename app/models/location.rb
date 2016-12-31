class Location < ApplicationRecord
  reverse_geocoded_by :lat, :lgt
  after_validation :geocode

  def within(distance)
    box = Geocoder::Calculations.bounding_box(self, km_to_mi(distance))
    Location.within_bounding_box(box).select { | location | location.id != self.id }
  end

  def distance_to(to, units: :km)
    super(to, units)
  end

  alias_method :distance_from, :distance_to

  private
  def km_to_mi(km)
    km * 0.621371
  end
end
