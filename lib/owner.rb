require 'pry'
class Owner
  
  attr_reader :name, :species, :cats, :dogs

  
  @@all = []
  
  def initialize(new_name)
    @name = new_name
    @species = "human"
    @cats = []
    @dogs = []
    @@all << self 
  end
  
  def say_species
    "I am a #{@species}."
  end
  
  def self.all 
    @@all
  end
  
  def self.count
    @@all.length 
  end
  
  def self.reset_all 
    @@all = []
  end
  
  def buy_cat(animal_name)
    new_animal_obj = Cat.new(animal_name, self)

  end
  
  def buy_dog(animal_name)
    new_animal_obj = Dog.new(animal_name, self)
  end
  
  def walk_dogs
    @dogs.each {|dog| dog.mood = "happy"}
  end
  
  def feed_cats
    @cats.each {|cat| cat.mood = "happy"}
  end
  
  def sell_pets
    @dogs.each do |dog| 
      dog.mood = "nervous"
      dog.owner = nil
    end
    @cats.each do |cat| 
      cat.mood = "nervous"
      cat.owner = nil 
    end
    @dogs = []
    @cats = []
  end 
  
  def list_pets
    "I have #{@dogs.count} dog(s), and #{@cats.count} cat(s)."
  end
  
end