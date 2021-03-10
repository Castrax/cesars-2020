class AddReferencesToWinners < ActiveRecord::Migration[5.2]
  def change
    add_reference :winners, :category, foreign_key: true
    add_reference :winners, :nominee, foreign_key: true
  end
end
