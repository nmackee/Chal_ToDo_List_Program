require "./register.rb"

class Task
  attr_accessor :id, :title, :content, :flag
  @@count = 0

  def initialize(task_params)
    @id = id = @@count += 1
    @title = task_params[:title]
    @content = task_params[:content]
  end
end
