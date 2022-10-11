# frozen_string_literal: true

module Admin
  # Product Controller
  class ProductsController < ApplicationController
    before_action :find_product, only: %i[show edit update destroy]
    helper_method :sort_column, :sort_direction

    def index
      @products =
        Product.search(params[:search])
            .order("#{sort_column} #{sort_direction}")
            .page params[:page]
      respond_to do |format|
        format.html
        format.xls { send_data @products.to_csv(col_sep: "\t") }
      end
    end

    def new
      @product = Product.new
    end

    def create
      @product = Product.new(product_params)
      if @product.save
        redirect_to admin_products_path
      else
        render 'new'
      end
    end

    def show; end

    def update
      if @product.update(product_params)
        redirect_to admin_products_path
      else
        render 'edit'
      end
    end

    def edit; end

    def destroy
      @product.destroy
      redirect_to admin_products_path
    end

    private

    def find_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:title, :price, :description, :status)
    end

    def sort_column
      Product.column_names.include?(params[:sort]) ? params[:sort] : 'id'
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
    end
  end
end
