class BookFetcher
    BOOKS_API_DOMAIN      = 'https://www.googleapis.com'.freeze
    BOOKS_API_COMMON_PATH = '/books/v1'.freeze

    
    def self.get_by_id(book_api_id)
        common_path = BOOKS_API_DOMAIN + BOOKS_API_COMMON_PATH
        body = Faraday.get("#{common_path}/volumes/#{book_api_id}").body
        @book_api_data = JSON.parse(body)
    end

    

    def self.call(query, start_index)
        new(query, start_index)
    end

     
    def initialize(query, start_index)
        @query       = query
        @start_index = start_index.to_i
    end

    def to_a
      data = JSON.parse(query_search.body)
      data["items"]
    end


    def query_search
        Faraday.get("#{common_path}/volumes?q=#{@query}&startIndex=#{@start_index}")
    end


    private

    def common_path
        BOOKS_API_DOMAIN + BOOKS_API_COMMON_PATH
    end 

end