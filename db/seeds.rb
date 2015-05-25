require "faker"

10.times do
  Task.create :task_description => Faker::Lorem.sentence, :completed => false
end