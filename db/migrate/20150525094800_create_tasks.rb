require_relative '../../config/application.rb'

class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |task|
      task.string :task_description
      task.boolean :completed
      task.datetime :created_at
      task.datetime :updated_at
    end
  end
end