class Register
  attr_reader :input_title, :input_content, :task_params

  def initial_register_task
    puts "----------------------"
    puts "| TO-DO-LIST-Manager |"
    puts "----------------------"
    puts "【登録】"
    puts "titleを入力してください"
    input_title = gets.chomp
    puts "contentを入力してください"
    input_content = gets

    @task_params = [{ title: input_title, content: input_content }]
  end
end
