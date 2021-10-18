module AdminHelper
    def ban_button_name(user)
      if user.ban?
        'разблокировать'
      else
        'заблокировать'
      end
    end
end
