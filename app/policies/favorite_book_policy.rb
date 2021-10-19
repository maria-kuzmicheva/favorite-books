class FavoriteBookPolicy
    attr_reader :user, :favorite_book

    def initialize(user, favorite_book)
      @user = user
      @favorite_book = favorite_book
    end
  
    def update?
      user.admin? || !post.published?
    end
end