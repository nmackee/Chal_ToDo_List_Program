require "./task.rb"
require "./register.rb"

class Todo
  def initialize(task_params)
    @tasks = []
    register_task(task_params)
  end

  def register_task(add_params)
    add_params.map { |param| @tasks << Task.new(param) }
    disp
  end

  def disp
    puts "task一覧"
    if @tasks.empty?
      puts "タスクはありません"
    else
      @tasks.each do |task|
        puts "[No.#{task.id}] #{task.title}: #{task.content}"
      end
    end
  end

  def select_menu
    while true
      menu_disp
      answer = gets.to_i

      case answer
      when 1
        adding_task
      when 2
        break
      when 3
        deleting_task
      when 4
        editing_task #(@tasks)
      end
    end
  end

  def menu_disp
    puts <<~EOS
           -----------------
           ★ SELECT MENU ★
           -----------------
         EOS

    text1 = " 1.【追加】 2.【終了】 "
    text2 = text1 + "3.【削除】 4.【編集】"

    if @tasks.empty?
      puts text1
    else
      puts text2
    end
  end

  def adding_task
    while true
      puts "titleを入力してください"
      add_title = gets.chomp
      puts "contentを入力してください"
      add_content = gets

      break if !add_title.empty? && !add_content.empty?
    end

    add_params = [{ title: add_title, content: add_content }]
    register_task(add_params)
  end

  def deleting_task
    disp
    while true
      puts "削除する番号を入力してください"
      delete_num = gets.to_i
      deleted_task = @tasks.find { |task| task.id == delete_num }

      break if !deleted_task.nil?
      puts "該当IDのタスクはありません"
      #puts "#{tasks.first.id}から#{tasks.last.id}の中から選んでください。"
    end
    @tasks.delete(deleted_task)
    disp
  end

  def editing_task #(tasks)
    disp
    while true
      puts "編集する番号を選んでください"
      edit_num = gets.to_i
      edited_task = @tasks.find { |task| task.id == edit_num }

      break if !edited_task.nil?
      puts "該当IDのタスクはありません"
      #puts "#{tasks.first.id}から#{tasks.last.id}の中から選んでください。"
    end

    puts "title"
    edit_title = gets.chomp
    puts "content"
    edit_content = gets.chomp

    edited_task.title = edit_title unless edit_title.empty?
    edited_task.content = edit_content unless edit_content.empty?

    disp
  end
end
