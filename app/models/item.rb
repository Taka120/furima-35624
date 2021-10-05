class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :area
  belongs_to :days_to_ship
  belongs_to :user
  has_one_attached :image
  has_one :purchase
  
  with_options numericality: { other_than: 1 , message: "can't be blank"} do
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :area_id
    validates :days_to_ship_id
  end

  with_options presence: true do
    validates :item_name
    validates :explanation
    validates :image
  end
  
  validates :item_price, format:{with: /\A[0-9]+\z/}, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
