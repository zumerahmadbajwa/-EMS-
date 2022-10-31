# E-commerce Management System

This E-commerce website project based on Ruby on Rails, by which there are two panels Admin || User. Admin was created from db command.
  * In Admin panel, admin have an access to create user, products(associated with discount and categories) and can view listing of users, products and order listing which the user ordered.
  * In User panel, first user ahev to sign up the account then after login he/she can view the different items and order them with add to cart and payment method functionality.

Gems I have used in this project:

  * Devise(used for authentication)
  * Pundit(used for authorization)
  * Bootstrap(used for styling)
  * Kaminari(used for pagination)
  * jwt(used for api)
  * bootstrap5-kaminari-views(used for pagination styling)
  * jbuilder(used for generating and rendering JSON responses)
  * jquery-rails(used for javascript/modals)
  * stripe(used for payment method)
  * letter_opener(used for email sending/recieving functionality)