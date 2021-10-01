class PagesController < ApplicationController
    before_action :require_current_user
    def index
       #@book = Book.find(params[:id])
        
        
    end
    def firstpage

        render 
    end
  end