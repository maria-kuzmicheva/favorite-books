namespace :assign_role_to_users do

    task go: :environment do 
      User.where("role is NULL").update_all(role: "actor")
    end

end
