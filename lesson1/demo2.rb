class Fixnum
  def seconds
    return self
  end

  def ago
    return Time.now - self
  end

  def from_now
    return Time.now + self
  end

  def years
    365 * days
  end

  def days
    24 * hours
  end

  def hours
    60 * minutes
  end

  def minutes
    self * 60
  end
end

# puts 2.seconds.ago
# puts 2.seconds.from_now
# puts 1.years.from_now
# puts 2.days.from_now
class Parent
  def altered()
    puts "PARENT altered()"
  end
end

class Child < Parent
  def altered()
    puts "CHILD, BEFORE PARENT altered()"
    super()
    puts "CHILD, AFTER PARENT altered()"
  end

end

dad = Parent.new()
son = Child.new()

dad.altered()
son.altered()
