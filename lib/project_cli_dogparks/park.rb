class ProjectCliDogparks::Park
  #Class containing all the relevant data for each dog park.
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
    name = doc.search('.section.address h4[1]').text
    binding.pry
  end

end
