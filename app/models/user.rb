# frozen_string_literal: true

# User
class User < ApplicationRecord
  # attr_accessor :login

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:login]

  enum role: %i[admin client]

  validate :password_lower_case
  validate :password_uppercase
  validate :password_special_char
  validate :password_contains_number

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :username, :email, :password, presence: true, on: :create

  def login
    @login || username || email
  end

  # Checks if the password contains an upper_case character
  def password_uppercase
    return unless password&.match(/\p{Upper}/).nil?

    errors.add :password, ' must contain at least 1 uppercase '
  end

  def password_lower_case
    return unless password&.match(/\p{Lower}/).nil?

    errors.add :password, ' must contain at least 1 lowercase '
  end

  # Checks if the password contains a special character
  def password_special_char
    special = "?<>',?[]}{=-)(*&^%$#`~{}!@."
    regex = /[#{special.gsub(/./) { |char| "\\#{char}" }}]/
    return if password =~ regex

    errors.add :password, ' must contain special character'
  end

  # Checks if the password contains an integer between 0 to 9
  def password_contains_number
    return if password&.count('0-9')&.positive?

    errors.add :password, ' must contain at least one number'
  end

  # Checks for username/email validation
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where(['lower(username) = :value OR lower(email) = :value',
                                    { value: login.downcase }]).first
    elsif conditions.key?(:username) || conditions.key?(:email)
      where(conditions.to_h).first
    end
  end
end
