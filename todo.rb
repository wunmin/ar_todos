require_relative 'config/application'
# puts "Put your application code in #{File.expand_path(__FILE__)}"

class MainProgram
  def self.start

    action = ARGV[0]

    case
      when action == "list"
        Task.list
      when action == "add"
        Task.add(ARGV[1])
      when action == "delete"
        Task.delete(ARGV[1].to_i)
      when action == "complete"
        Task.complete(ARGV[1].to_i)
      else
        p "Please choose from the following options only:-"
        p "- list"
        p "- add"
        p "- delete"
    end
  end
end

# Parse the file
MainProgram.start