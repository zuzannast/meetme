module CityHelper
  def cities_for_select
    City.all.collect { |city| [city.name, city.id] }
  end
end
