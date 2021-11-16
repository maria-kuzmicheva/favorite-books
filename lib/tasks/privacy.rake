namespace :privacy do

    desc "This task changes privacy of booklists"
    task toggle_booklist_status: :environment do
       
        BookList.find_each{|booklist| booklist.toggle!(:public)} 
        puts "ok"

    end
end
