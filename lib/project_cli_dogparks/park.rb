class ProjectCliDogparks::Park
  attr_accessor :name, :location, :description, :url

  def self.all
    park_1 = self.new
    park_1.name = "Jack Carter Park"
    park_1.location = "2215 Pleasant Valley Dr, Plano, TX 75023"
    park_1.description = "The dog park is a double-gated, fenced, 2-acre area along Bluebonnet Trail, near its intersection with Chisholm Trail in central Plano."
    park_1.url = "http://www.plano.gov/Facilities/Facility/Details/Dog-Park-at-Jack-Carter-Park-29"

    park_2 = self.new
    park_2.name = "Ruff Range"
    park_2.location = "5335 4th Army Memorial Dr, Frisco, TX 75034"
    park_2.description = "Ruff Range Dog Park is located at 5335 4th Army Memorial Drive, within B.F. Phillips Community Park. Ruff Range Dog Park features a large and small dog off-leash area as well as parking."
    park_2.url = "http://www.ci.frisco.tx.us/Facilities/Facility/Details/Ruff-Range-Dog-Park-54"

    park_3 = self.new
    park_3.name = "Northbark"
    park_3.location = "4899 Gramercy Oaks, Dallas, TX 75287"
    park_3.description = "NorthBark Dog Park is a 22.3 acre 'off-leash' dog park, in far north Dallas. It is located near the North Dallas Tollway and the President George Bush Tollway."
    park_3.url = "http://www.dallasparks.org/Facilities/Facility/Details/NorthBark-Dog-Park-359"

    [park_1, park_2, park_3]
  end
end
