class AddPhotosToNominees < ActiveRecord::Migration[5.2]
  def change
    add_column :nominees, :title_photo, :string
    add_column :nominees, :subtitle_photo, :string
  end
end
