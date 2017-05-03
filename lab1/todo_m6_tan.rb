class Task
  attr_reader :name
  def initialize(name)
    @name = name
  end

  # an empty default for a subclass to implement
  def get_time_required
    0 # number of minutes
  end
end


class ReadingTask < Task
  def initialize
    super 'Read the task out loud'
  end

  def get_item_required
    1
  end
end

class CodingTask < Task
  def initialize
    super 'Coding'
  end

  def get_item_required
    15
  end
end

class ProofingTask < Task
  def initialize
    super 'Double check to make sure things look good'
  end

  def get_item_required
    5
  end
end


class CompositeTask < Task
  def initialize(name)
    super(name)
    @sub_tasks = []
  end

  def add_sub_task(task)
    @sub_tasks.push(task)
  end

  def remove_sub_task(task)
    @sub_tasks.delete_if {|t| t.name == task.name}
  end

  def get_time_required
    @sub_tasks.inject(0){|sum, task| sum + task.get_item_required}
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
