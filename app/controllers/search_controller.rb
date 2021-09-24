class SearchController < ApplicationController
    def index
        @query = params[:query]
        #params = {query: "gay", commit: "Search"}
      
        search_results = BookFetcher.call(@query)

        @books_data = search_results.to_a
        
    end

end
