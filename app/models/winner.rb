class Winner < ApplicationRecord
  belongs_to :category
  belongs_to :nominee
end
