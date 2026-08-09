class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :token, :item_id, :user_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'はハイフンを含む形式で入力してください' }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は10桁以上11桁以内の半角数値で入力してください' }
    validates :token
    validates :item_id
    validates :user_id
  end
  validates :prefecture_id, numericality: { other_than: 0, message: 'を選択してください' }

  def save
    purchase = Purchase.create!(item_id: item_id, user_id: user_id)
    Address.create!(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number,
                    building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end
