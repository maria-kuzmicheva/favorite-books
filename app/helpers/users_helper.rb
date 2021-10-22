module UsersHelper

    def public_button(book_list)
        if book_list.public?
          'сделать приватным'
        else
          'сделать публичным'
        end
      end
end
