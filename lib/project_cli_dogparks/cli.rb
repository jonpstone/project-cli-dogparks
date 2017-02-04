class ProjectCliDogparks::CLI
  # Class to manage the structure and flow of the gem.

  def call
    list_parks
    choice
    so_long
  end

  def list_parks
    puts "Welcome to the Plano area Dog Parks gem!"
    @park = ProjectCliDogparks::Park.all
    @park.each_with_index do |park, i|
      puts "#{i+1}. #{park.name} - #{park.city}"
    end
  end

  def choice
    input = nil
    while input != "exit"
      puts "Please make a selection or type 'exit' to leave or 'menu' to return to the list."
      input = gets.strip.downcase

      if input.to_i > 0
        user_park = @park[input.to_i-1]
        puts <<~EOF

          #{user_park.name}\n
          #{user_park.location}\n
          #{user_park.description}\n
          #{user_park.url}

        EOF
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
