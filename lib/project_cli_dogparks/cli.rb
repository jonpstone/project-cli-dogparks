class ProjectCliDogparks::CLI

  def call
    list_parks
    choice
  end

  def list_parks
    puts <<~EOF
      DOG PARKS IN THE PLANO, TX AREA.
      1. Jack Carter Park - Plano
      2. Ruff Range - Frisco
      3. Northbark - North Dallas
    EOF
  end

  def choice
    puts "Please make a selection..."
  end

end
