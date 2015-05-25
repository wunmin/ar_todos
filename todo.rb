require_relative 'config/application'
# puts "Put your application code in #{File.expand_path(__FILE__)}"

class MainProgram
  def self.start

    action = ARGV[0]

    case action
      when "list"
        Task.list
      when "add"
        Task.add(ARGV[1])
      when "delete"
        Task.delete(ARGV[1].to_i)
      when "complete"
        Task.complete(ARGV[1].to_i)
      when "all_completed"
        Task.all_completed
      when  "all_incomplete"
        Task.all_incomplete
      else
        p "Please choose from the following options only:-"
        p "- list"
        p "- add"
        p "- delete"
        p "- complete"
        p "- all_completed"
        p "- all_incomplete"
    end
  end
end

# Parse the file
MainProgram.start