class User < ApplicationRecord
    has_and_belongs_to_many :favorite_books
    has_many :comments
    has_many :book_lists
    has_many :ratings
    has_many :rating_books, through: :ratings, source: :favorite_book
    
    has_one_attached :avatar do |attachable|
      attachable.variant :thumb, resize: "100x100"
    end
    
    include ::BCrypt

    #EMAIL_REGEX = /[\\w!#$%&'*+\/=?`{|}~^-]+(?:\\.[\\w!#$%&'*+\/=?`{|}~^-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$/ 

    attr_accessor :new_password, :new_password_confirmation
    

    def password
      @password ||= Password.new(self.password_digest)
    end
    
    def password=(new_password)
      @password = Password.create(new_password)
      self.password_digest = @password
    end
    

    validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
   
    #validates_format_of :email, with: EMAIL_REGEX, message: "не соответствует формату"
    #validates_format_of :email, with: EMAIL_REGEX, on: :create, message: "incorrect format"
    

    validates :password, confirmation: true
     

    def admin? 
      self.role == "admin"
    end
end
