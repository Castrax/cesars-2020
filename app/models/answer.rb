class Answer < ApplicationRecord
  belongs_to :category
  belongs_to :nominee
  belongs_to :user

  def winner?(category_id)
    self.nominee_id == Winner.find_by(category_id: category_id)&.nominee_id
  end
end
