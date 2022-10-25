# frozen_string_literal: true

# Home Controller
class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  def index; end
end
