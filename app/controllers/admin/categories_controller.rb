# frozen_string_literal: true

# categories Controller
module Admin
  # Class for CategoriesController
  class CategoriesController < ApplicationController
    before_action :find_category, only: %i[show update edit destroy]

    def index
      @categories = Category.all.order(name: :desc)
    end

    def new
      @category = Category.new
    end

    def create
      @category = Category.new(category_params)
      if @category.save
        redirect_to admin_categories_path
      else
        render 'new'
      end
    end

    def show; end

    def update
      if @category.update(category_params)
        redirect_to admin_categories_path
      else
        render 'edit'
      end
    end

    def edit; end

    def destroy
      @category.destroy
      redirect_to admin_categories_path
    end

    private

    def find_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
  end
end
