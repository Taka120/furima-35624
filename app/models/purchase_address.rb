class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_number, :prefecture_id, :municipalities, :address, :building_name, :telephone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :municipalities
    validates :address
    validates :telephone_number, format: {with: /\A\d{10,11}\z/, message: "is invalid"}
    validates :token
  end
  validate :building_name

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_number: postal_number, prefecture_id: prefecture_id, municipalities: municipalities, address: address, telephone_number: telephone_number, building_name: building_name, purchase_id: purchase.id)
  end
end