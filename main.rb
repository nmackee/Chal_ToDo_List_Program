require "./task.rb"
require "./todo.rb"
require "./register.rb"

register = Register.new
register.initial_register_task
to_do = Todo.new(register.task_params)
to_do.select_menu
