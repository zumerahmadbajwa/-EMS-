
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

How the code is used?
 * Controllers(where you add your logic)
 * Models(Data representation and as well as your associations of table because models interact with database)
 * Views(works as template, you can do styling through HTML/CSS etc. We are able to to use embedded ruby in rails. In views, you will create files with extension .html.erb)
 * In assets, there you can add images, js code and customized css code.
 
Here is view of my WebPage:

 
 <img width="1280" alt="Screenshot 2022-10-31 at 5 44 37 PM" src="https://user-images.githubusercontent.com/105544658/199010881-dc537adc-0b00-4936-bb0d-c95ff65dbe7e.png">
