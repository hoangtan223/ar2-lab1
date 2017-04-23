class Todo
  attr_reader :title, :items

  def initialize(&formatter)
    @title = "Todo"
    @items = ["Decide supervisor and driver roles", "Implement Milestone 1"]
    @formatter = formatter
  end

  def display
    @formatter.call(self)
  end
end


todo = Todo.new do |context|
  # your code here
  puts "# #{context.title}"
  context.items.each do |item|
    puts "- [] #{item}"
  end
end

todo.display