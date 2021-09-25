class SearchController < ApplicationController
    def index
        #@query = params[:query]
        #params = {query: "gay", commit: "Search"}

        #@start_index = params[:start_index]

        search_results = BookFetcher.call(params[:query], params[:start_index])

        @books_data = search_results.to_a
        
    end

end
