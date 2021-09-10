class BooksController < ApplicationController
    def search
        @query=params[:query]
    end
end
