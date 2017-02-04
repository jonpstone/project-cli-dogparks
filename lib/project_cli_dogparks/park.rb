class ProjectCliDogparks::Park
  # Class containing all the relevant data for each dog park.
  attr_accessor :name, :location, :city, :description, :url

  def self.all
    #Scrape Plano area dog park .gov websites for data.
    self.scrape_parks
  end

  def self.scrape_parks
    parks = []

    parks << self.scrape_plano

    parks
  end

  def self.scrape_plano
    doc = Nokogiri::HTML(open("http://www.plano.gov/Facilities/Facility/Details/Dog-Park-at-Jack-Carter-Park-29"))

    park = self.new

    # The .name attribute, easy enough...
    park.name = doc.search('.section.address h4[1]').text

    # The .location attribute had to be concatenated from different variables, if in rails...
    # I just would've used .squish on "location = doc.search('p.adr').text".
    # In this case I had to look up a regex formula to do it for me concerning "location_city_state".
    location_street = doc.search('p.adr span.street-address').text
    location_city_state = doc.search('p.adr span.locality').text.gsub(/(?<=[a-z])(?=[A-Z])/, ', ')
    location_zip = doc.search('span.postal-code').text
    # The ingredients above make the .location attribute.
    park.location = "#{location_street} " + "#{location_city_state} " + "#{location_zip}"

    # The "location_city_state" value is used again for the .city attribute.
    park.city = "#{location_city_state}"

    # The .description will be hard coded for now.
    park.description = <<~EOF
      The dog park is a double-gated, fenced, 2-acre area along Bluebonnet Trail, 
      near its intersection with Chisholm Trail in central Plano. The park features
      a separate area for large and small dogs with shade shelters, picnic tables,
      benches. LED lighting, water stations for humans and dogs, waste pickup/disposal
      stations and a dog rinse station near the parking lot.

      The Dog Park closes at 9:30 pm. A warning strobe will be activated before
      the lights automatically turn off. Please leave adequate time to vacate the
      Dog Park. The dog rinse station is winterized during the winter months and
      remains off until spring.

      Please park in the parking lot provided west of the area. You will find the
      parking lot by traveling one half-block north on Pleasant Valley Drive from
      its intersection with Spring Creek Parkway, west of Custer Road.

      The dog park is the only off-leash area designated by the Parks and Recreation
      Department. When outside the dog park enclosure, all animals are required to
      be restrained on a maximum 6-foot leash at all times. This includes arriving
      and departing the dog park.
    EOF

    # Url hardcoded for now.
    park.url = "http://www.plano.gov/Facilities/Facility/Details/Dog-Park-at-Jack-Carter-Park-29"
    park
  end

end
