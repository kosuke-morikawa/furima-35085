class Order < ApplicationRecord
  belongs_to :product
  has_one :destination
  belongs_to :user
end
