class ProjectCliDogparks::Park
  # Class containing all the relevant data for each dog park.
  attr_accessor :name, :city, :location, :description, :url

  def self.all
    #Scrape Plano area dog park .gov websites for data.
    self.scrape_parks
  end

  def self.scrape_parks
    parks = []



    parks
  end

  def self.scrape_plano
    doc = Nokogiri::HTML(open("http://www.plano.gov/Facilities/Facility/Details/Dog-Park-at-Jack-Carter-Park-29"))

    # The .name attribute, easy enough...
    name = doc.search('.section.address h4[1]').text

    # The .location attribute had to be concatenated from different variables, if in rails...
    # I just would used .squish on "location = doc.search('p.adr').text.squish".
    # In this case I had to look up a regex formula to do it for me concerning "location_city_state".
    location_street = doc.search('p.adr span.street-address').text
    location_city_state = doc.search('p.adr span.locality').text.gsub(/(?<=[a-z])(?=[A-Z])/, ', ')
    location_zip = doc.search('span.postal-code').text
    location = "#{location_street} " + "#{location_city_state} " + "#{location_zip}"

    # The .description isn't perfect yet.
    description = doc.search('div.editorContent').text.gsub(/\s/, ' ')

    # Hard coded for now.
    url = "http://www.plano.gov/Facilities/Facility/Details/Dog-Park-at-Jack-Carter-Park-29"

    binding.pry
  end

end
