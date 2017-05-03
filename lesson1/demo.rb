module Animal
  def sleep
    puts 'sleeping'
  end

  def self.whoami
    puts 'Animal'
  end
end


module Runnable
  def move
    puts 'moving'
  end

  def self.whoami
    puts 'Runnable'
  end
end

class Dog
  include Animal
  include Runnable # module isntance method => class instance method
  extend Runnable # module instance method => class method
end

# extend Runnable <=> Dog.extend(Runnable)
# include Runnable <=> Dog.new.extend(Runnable)

Dog.new.sleep
Dog.new.move
Dog.move
