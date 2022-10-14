# frozen_string_literal: true

class User
  # ProductsController
  class ProductsController < ApplicationController
    before_action :current_cart
    def index
      @products = Product.order(:created_at)
    end
  end
end
