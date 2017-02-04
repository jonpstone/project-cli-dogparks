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

    # The .description atribute really hurt my head, a huge chunk of code on the plano.gov was not...
    # placed inside an element, so for now I have hardcoded it into a heredoc.
    para1 = doc.search('font.Headline').text.strip
    para2 = <<~EOF
      The dog park is a double-gated, fenced, 2-acre area along Bluebonnet Trail,\n
      near its intersection with Chisholm Trail in central Plano. The park features\n
      a separate area for large and small dogs with shade shelters, picnic tables,\n
      benches. LED lighting, water stations for humans and dogs, waste pickup/disposal\n
      stations and a dog rinse station near the parking lot.
    EOF
    para3 =
    para4 =
    para5 =

    description = <<~EOF

      #{para1}\n
      #{para2}\n
      #{para3}\n
      #{para4}\n
      #{para5}

    EOF

    binding.pry
  end

end
