class Task
  attr_reader :name
  def initialize(name)
    @name = name
  end
  
  def total_number_basic_tasks
    1
  end

  # an empty default for a subclass to implement
  def get_time_required
    0 # number of minutes
  end
end

class ReadingTask < Task
  def initialize(name)
    super(name)
  end

  def get_time_required
    1
  end
end

class CodingTask < Task
  def initialize
    super('Coding')
  end

  def get_time_required
    15
  end
end

class ProofingTask < Task
  def initialize
    super("Double check to make sure thing look good")
  end

  def get_time_required
    5
  end
end

class CompositeTask < Task
  attr_writer :sub_tasks

  def initialize(name)
    super(name)
    @sub_tasks = []
  end
  
  def add_sub_task(task)
    # Implement this
    @sub_tasks << task
  end
  
  def remove_sub_task(task)
    # Implement this
    @sub_tasks.delete(task)
  end

  def << (task)
    @sub_tasks << task
  end

  def [] (index)
    @sub_tasks[index]
  end

  def total_number_basic_tasks
    @total_basic_tasks = 0
    @sub_tasks.each do |sub_task|
      @total_basic_tasks += sub_task.total_number_basic_tasks
    end
    @total_basic_tasks
  end

  def get_time_required
    # Calculate based on the time taken for sub tasks
    @total_time = 0
    @sub_tasks.each do |sub_task|
      @total_time += sub_task.get_time_required
    end
    @total_time
  end
end

class MilestoneTask < CompositeTask
  def initialize(name)
    super(name)
    add_sub_task ReadingTask.new("Read the task out loud")
    add_sub_task CodingTask.new
    add_sub_task ProofingTask.new
  end
end


class Todo
  include Enumerable

  attr_reader :title
  def initialize(title)
    @title = title
    @tasks = []
  end
      
  def add_task(task)
   @tasks << task
  end

  def each(&block)
    # Implement this
    @tasks.each(&block)
  end
  
  def remove_task(task)
    # Implement this
    @tasks.delete(task)
  end

  def << (task)
    @tasks << task
  end

  def [] (index)
    @tasks[index]
  end

  def total_number_basic_tasks
    @total_basic_tasks = 0
    @tasks.each do |task|
      @total_basic_tasks += task.total_number_basic_tasks
    end
    @total_basic_tasks
  end

  def get_time_required
    # Calculate based on the time taken for sub tasks
    @total_time = 0
    @tasks.each do |task|
      @total_time += task.get_time_required
    end
    @total_time
  end
end

todo = Todo.new("Lab 1")
todo.add_task MilestoneTask.new("Milestone 8")
todo.add_task Task.new("Discuss with my partner")
todo.add_task Task.new("Ask the instructor some questions")
todo.add_task ReadingTask.new("Look up the any? method")

puts todo.any? {|task| task.total_number_basic_tasks > 1}
# list them
puts todo.select {|task| task.total_number_basic_tasks > 1}
# print all tasks
todo.each do |task|
  puts task.name
end
# get easy tasks
puts todo.group_by(&:get_time_required)