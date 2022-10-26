# frozen_string_literal: true

# Product
class Product < ApplicationRecord
  paginates_per 5
  belongs_to :category
  belongs_to :coupon, optional: true
  has_many :order_items
  has_one_attached :image
  enum status: %i[published draft pending]
  validates :title, :price, :description, presence: true

  # search product
  def self.search(search)
    if search.present?
      where(' lower(products.title) LIKE :value ', value: "%#{search.downcase}%")
    else
      self
    end
  end

  # download the xls or csv files
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end
end
