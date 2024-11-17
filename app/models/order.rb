class Order < ApplicationRecord
    has_many :cart_items, dependent: :destroy
    validates :total_price, presence: true
end
