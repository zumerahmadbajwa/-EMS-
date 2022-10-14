# frozen_string_literal: true

# discount model file
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
end
