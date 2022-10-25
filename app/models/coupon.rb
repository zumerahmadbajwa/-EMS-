# frozen_string_literal: true

# coupon file
class Coupon < ApplicationRecord
  paginates_per 5

  validates :name, :price, presence: true

  has_many :products

  def self.search(search)
    if search.present?
      where('lower(coupons.name) LIKE :value', value: "%#{search.downcase}%")
    else
      self
    end
  end

  # download the xls or csv files
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |coupon|
        csv << coupon.attributes.values_at(*column_names)
      end
    end
  end

  def coupon_for_products(products)
    products = products.compact.reject!(&:empty?)
    Product.where(id: products).update_all(coupon_id: id)
  end

  def self.validate_coupon(coupon, cart)
    value = Coupon.find_by(name: coupon).present? ? Coupon.find_by(name: coupon).price : 0

    if value.positive?
      count = cart.products.where('coupon_id = ?', Coupon.find_by(name: coupon).id).count
      value *= count
    end
    value
  end
end
