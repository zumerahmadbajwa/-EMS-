# frozen_string_literal:true

json.users do |json|
  json.array! @users do |user|
    json.id user.id
    json.username user.username
    json.email user.email
    json.role user.role
  end
end
