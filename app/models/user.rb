class User < ApplicationRecord
    include ::BCrypt

    #EMAIL_REGEX = /[\\w!#$%&'*+\/=?`{|}~^-]+(?:\\.[\\w!#$%&'*+\/=?`{|}~^-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$/ 

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
end
