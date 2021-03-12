class Category < ApplicationRecord
  has_many :nominees, dependent: :destroy
  has_one :answer, dependent: :destroy
  has_one :winner, dependent: :destroy
  has_one_attached :banner
end
