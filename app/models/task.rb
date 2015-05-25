class Task < ActiveRecord::Base
  validates :task_description, presence: true

  def self.list
    task_array = Task.all
    task_array.each_with_index do |task, index|
      puts "#{status(task.completed)} #{index + 1}. #{task.task_description}"
    end
  end

  def self.all_completed
    task_array = Task.all
    new_array = []
    task_array.each do |task|
      if task.completed == true
        new_array << task
      end
    end

    new_array.each_with_index do |t, index|
      puts "#{index + 1}. #{t.task_description}"
      end
  end

  def self.all_incomplete
    task_array = Task.all
    new_array = []
    task_array.each do |task|
      if task.completed == false
        new_array << task
      end
    end

    new_array.each_with_index do |t, index|
      puts "#{index + 1}. #{t.task_description}"
      end
  end

  def self.add(new_task_desc)
  Task.create :task_description => new_task_desc, :completed => false
    p "Added '#{new_task_desc}'' to your task list."
    p "Your remaining tasks are:"
    list
  end

  def self.delete(id)
    task_array = Task.all
    task_array.each_with_index do |task, index|
      if index == id - 1
        task_to_delete = task.task_description
        task_id_to_delete = Task.find_by(task_description: task_to_delete).id
        Task.destroy(task_id_to_delete)
        p "Your remaining tasks are:"
        list
      end
    end
  end

  def self.status(var)
    if var == false
      "[ ]"
    else var == true
      "[X]"
    end
  end

  def self.complete(id)
    task_array = Task.all
    task_array.each_with_index do |task, index|
      if index == id - 1
        task.completed = true
        task.save

        puts "Task ##{index + 1} has been marked as completed."
      end
      p "Your remaining tasks are:"
      list
    end
  end



end