require 'csv'

def create_new_memo
    puts "拡張子を除いたファイル名を入力してください:"
    file_name = gets.chomp
    
    puts "メモしたい内容を入力してください:"
    memo_content = gets.chomp

    CSV.open("#{file_name}.csv", 'w') do |csv|
        csv << [memo_content]
    end

    puts "メモが保存されました。"
end

def edit_existing_memo
    puts "拡張子を除いたファイル名を入力してください:"
    file_name = gets.chomp

    if File.exist?("#{file_name}.csv")
        puts "メモしたい内容を入力してください:"
        new_content = gets.chomp

        CSV.open("#{file_name}.csv", 'a') do |csv|
            csv << [new_content]
        end

        puts "メモが編集されました。"
    else
        puts "指定したファイルは存在しません。"
    end
end

puts "以下の操作から選んでください:"
puts "1. 新しいメモを作成"
puts "2. 既存のメモを編集"
user_choice = gets.chomp.to_i

if user_choice == 1
    create_new_memo
elsif user_choice == 2
    edit_existing_memo
else
    puts "無効な選択です。プログラムを終了します。"
end
