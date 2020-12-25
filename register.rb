class Register
  attr_reader :task_params

  def initial_register_task
    puts <<~EOS
           ----------------------
           | TO-DO-LIST-Manager |
           ----------------------
           【登録】
         EOS

    while true
      puts "titleを入力してください"
      input_title = gets.chomp
      puts "contentを入力してください"
      input_content = gets

      break if !input_title.empty? && !input_content.empty?
    end

    @task_params = [{ title: input_title, content: input_content }]
  end
end
