class SearchController < ApplicationController
    before_action :require_current_user
    def index
        #@query = params[:query]
        #params = {query: "gay", commit: "Search"}

        #@start_index = params[:start_index]

        search_results = BookFetcher.call(params[:query], params[:start_index])
         
        
        @books_data = search_results.to_favorite_books
        
    end
    
    

end
