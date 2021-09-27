class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :area
  belongs_to :ays_to_ship

  belongs_to :user
  has_one_attached :image

  validates :item_name, :string, presence: true, message: "can't be blank"
  validates :explanation, :text, presence: true, message: "can't be blank"
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_fee_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :area_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :days_to_ship_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, :integer, presence:true, message: "can't be blank"
    format:{with: /\A[0-9]+\z/, message: "is invalid"}, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 , message: "is out of setting range" }
end
