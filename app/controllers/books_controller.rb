class BooksController < ApplicationController
    def search
        @query = params[:query]
        params = {query: "gay", commit: "Search"}
      
        searchresults = BookFetcher.call(@query)

        @books_data = searchresults.to_a
    end
    def create
        @title = params[:title]
        @author = params[:description]
        
       
    end

end
