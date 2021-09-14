class BookFetcher
    BOOKS_API_DOMAIN      = 'https://www.googleapis.com'.freeze
    BOOKS_API_COMMON_PATH = '/books/v1'.freeze

    def self.call(query)
        new(query)
    end
     
    def initialize(query)
        @query=query
    end

    def to_a
      data = JSON.parse(query_search.body)
      data["items"]
    end


    def query_search
        Faraday.get("#{common_path}/volumes?q=#{@query}")
    end

   
    private
    def common_path
        BOOKS_API_DOMAIN + BOOKS_API_COMMON_PATH
    end 

     def client
        Faraday.new
    end
end