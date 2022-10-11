# frozen_string_literal: true

# InviteMailer
class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def send_invitation(user, password)
    @user = user
    @password = password

    mail(to: @user.email, subject: 'Welcome to My EMS_project Site')
  end
end
