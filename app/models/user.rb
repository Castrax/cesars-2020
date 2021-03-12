class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :answers
  validates :prenom, presence: true
  validates :nom, presence: true
  validates :email, presence: true, uniqueness: true

  def points(category)
    points = 0
    if self.answers.find_by(category_id: category.id)&.nominee == Winner.find_by(category_id: category.id)&.nominee
      points += category.points
    else
      points += 0
    end
    points
  end
end
