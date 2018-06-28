class Item
  attr_accessor :name, :price
  
  @@all = []

  def initialize(name,price)
    @name = name
    @price = price
    @@all << self
  end
  
  def self.all 
    @@all
  end
  
  def self.find_by_name(name)
    self.all.select { |item| item.name == name }.first
  end
end
