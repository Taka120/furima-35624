class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :area
  belongs_to :ays_to_ship

  belongs_to :user
  has_one_attached :image
end
