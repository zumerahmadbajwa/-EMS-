# frozen_string_literal: true

class User
  # ProductsController
  class ProductsController < ApplicationController
    def index
      @products = Product.order(title: :desc)
    end
  end
end
