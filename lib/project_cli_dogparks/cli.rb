class ProjectCliDogparks::CLI

  def call
    list_parks
    choice
    so_long
  end

  def list_parks
    puts "Welcome to the Plano area Dog Parks gem!"
    @park = ProjectCliDogparks::Park.all
    @park.each_with_index do |park, i|
      puts "#{i+1}. #{park.name} - #{park.location}"
    end
  end

  def choice
    input = nil
    while input != "exit"
      puts "Please make a selection or type 'exit' to leave or 'menu' to return to the list."
      input = gets.strip.downcase
      if input.to_i > 0
        puts @park[input.to_i-1]
      elsif input == "menu"
        list_parks
      else
        puts "Not a vaild choice. Please choose 'menu' or 'exit'"
      end
    end
  end

  def so_long
    puts "Have fun walking your dog(s)!"
  end

end
