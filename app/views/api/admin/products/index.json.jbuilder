# frozen_string_literal:true

json.products do |json|
  json.array! @products do |product|
    json.id product.id
    json.title product.title
    json.price product.price
    json.description product.description
    json.status product.status
  end
end