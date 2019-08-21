class BabyDragon
  MAX_SATIATION = 10
  MAX_HYDRATION = 10
  
  DRAGON_COLORS = ["red", "green", "blue", "yellow", "fuschia"]
  
  attr_reader :name, :color
  
  def initialize(input_name, color)
    @name = input_name
    if DRAGON_COLORS.include?(color.downcase)
      @color = color.downcase
    else
      raise ArgumentError.new("#{color} is not a valid color.")
    end
    
    @stuff_in_belly = 5
    @thirst_level = 5
    @is_asleep = false
    
    print_charmander
  end
  
  # Charmander art came from: https://www.asciiart.eu/video-games/pokemon
  def print_charmander
    puts "\nHere's your dragon! Meet #{@name}!"
    File.open("charmander.txt").each do |line|
      puts line
    end
  end
  
  def use_special_power
    case @color
    when "red"
      puts "\n#{@name} spits fire!"
    when "green"
      puts "\n#{@name} tears up some plants!"
    when "blue"
      puts "\n#{@name} goes for a swim!"
    when "yellow"
      puts "\n#{@name} spits lightning!"
    when "fuschia"
      puts "\n#{@name} plants some flowers."
    end
    
    make_time_pass
  end
  
  def play
    puts "\n#{@name} is playing by juggling different knives."
    
    make_time_pass
  end
  
  def drink
    @thirst_level = MAX_HYDRATION
    
    puts "\n#{@name} just drank a full glass of orange juice."
    
    make_time_pass
  end
  
  def eat
    @stuff_in_belly = MAX_SATIATION
    
    puts "\n#{@name} just ate a full meal of dragonfruit."
    
    make_time_pass
  end
  
  def make_time_pass
    puts "Time is passing... ... ..."
    
    # If the dragon can get thirstier, get thirstier
    if @thirst_level > 0 
      @thirst_level -= 1
    else
      puts "\n#{name} died :("
      exit
    end
    
    # If the dragon can get hungrier, get hungrier
    if @stuff_in_belly > 0 
      @stuff_in_belly -= 1
      
      # Otherwise, dragon wakes up if it is sleeping, dragon eats you, program exits
    else
      if @is_asleep
        @is_asleep = false
        puts "\n#{@name} woke up!"
      end
      
      puts "\n#{@name.upcase} EATS YOU!"  
      exit
    end
  end
  
  def sleep
    @is_asleep = true
    
    puts "\n#{@name} cuddles with a stuffed animal dragon and falls asleep..."
    
    3.times do 
      make_time_pass
    end
    
    @is_asleep = false
  end
end
