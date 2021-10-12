class StartController < ApplicationController
    before_action :require_current_user

    def search
        @book_lists = BookList.where(public: true).order(created_at: :desc).limit(15) 
    
        @book_lists.each do |book_lists|
        end

       
             

    end
    
    def login
        
    end
    def show_book_lists
        
        
    end

end
