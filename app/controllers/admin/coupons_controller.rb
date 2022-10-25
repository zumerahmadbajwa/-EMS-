# frozen_string_literal: true

module Admin
  # Coupon Controller
  class CouponsController < ApplicationController
    before_action :find_coupon, only: %i[show edit update destroy]
    helper_method :sort_column, :sort_direction

    def index
      @coupons =
        Coupon.search(params[:search])
              .order("#{sort_column} #{sort_direction}")
              .page params[:page]
      respond_to do |format|
        format.html
        format.xls { send_data @coupons.to_csv(col_sep: "\t") }
      end
    end

    def new
      @coupon = Coupon.new
    end

    def create
      @coupon = Coupon.new(coupon_params)
      ActiveRecord::Base.transaction do
        @coupon.save!
        @coupon.coupon_for_products(params[:coupon][:products])
        redirect_to admin_coupons_path, notice: 'Disocunt is saved.'
      rescue StandardError
        render 'new'
      end
    end

    def show; end

    def update
      if @coupon.update(coupon_params)
        redirect_to admin_coupons_path
      else
        render 'edit'
      end
    end

    def edit; end

    def destroy
      @coupon.destroy
      redirect_to admin_coupons_path
    end

    private

    def find_coupon
      @coupon = Coupon.find(params[:id])
    end

    def coupon_params
      params.require(:coupon).permit(:name, :price)
    end

    def sort_column
      Coupon.column_names.include?(params[:sort]) ? params[:sort] : 'id'
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
    end
  end
end
