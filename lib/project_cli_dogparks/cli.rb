class ProjectCliDogparks::CLI

  def call
    list_parks
    choice
    so_long
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
    input = nil
    while input != "exit"
      puts "Please make a selection or type 'exit'"
      input = gets.strip.downcase
      case input
      when "1"
        puts "blah blah"
      when "2"
        puts "blah blah blah"
      when "3"
        puts "blah blah blah blah"
      end
    end
  end

  def so_long
    puts "Have fun walking your dog(s)!"
  end

end
