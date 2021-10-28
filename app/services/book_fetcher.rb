

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

        def to_favorite_books
            to_a.map do |data_hash| 
                favorite_book             = FavoriteBook.new  
                favorite_book.api_data    = data_hash
                favorite_book.book_api_id = data_hash["id"]
                favorite_book
            end
        end

        def to_a
        data = JSON.parse(query_search.body)
        data["items"]
        end


        def query_search
            # Rails.logger.info "Heellloo Mary!!!"
            api_connection.get("#{BOOKS_API_COMMON_PATH}/volumes?q=#{@query}&startIndex=#{@start_index}")
        end

        def api_connection
            Faraday.new(url: BOOKS_API_DOMAIN) do |faraday|
                faraday.response :logger # log requests and responses to $stdout
            end 
        end



    end
