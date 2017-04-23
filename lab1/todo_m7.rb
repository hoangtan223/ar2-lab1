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
  def initialize
    super('Read the task out loud')
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
    add_sub_task ReadingTask.new
    add_sub_task CodingTask.new
    add_sub_task ProofingTask.new
  end
end