# frozen_string_literal: true

module Api
  # Admin
  module Admin
    # Product Controller
    class ProductsController < ApplicationController
      before_action :find_product, only: %i[show edit update destroy]
      helper_method :sort_column, :sort_direction

      def index
        @products = Product.all
      end

      def new; end

      def create
        @product = Product.create(product_params)
      end

      def show; end

      def update
        @product.update(product_params)
      end

      def edit; end

      def destroy
        @product.destroy
      end

      private

      def find_product
        @product = Product.find(params[:id])
      end

      def product_params
        params.require(:product).permit(:title, :price, :description, :status, :category_id, :image, :coupon_id)
      end

      def sort_column
        Product.column_names.include?(params[:sort]) ? params[:sort] : 'id'
      end

      def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
      end
    end
  end
end
