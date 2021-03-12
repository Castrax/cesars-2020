class Nominee < ApplicationRecord
  belongs_to :category
  has_one :answer, dependent: :destroy
  has_one_attached :photo

  def name
    self.title_text
  end
end
