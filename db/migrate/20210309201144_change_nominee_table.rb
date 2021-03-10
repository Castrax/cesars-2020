class ChangeNomineeTable < ActiveRecord::Migration[5.2]
  def change
    rename_column :nominees, :name, :title_text
    add_column :nominees, :subtitle_text, :text
    remove_column :nominees, :real, :string
    remove_column :nominees, :winner, :boolean
  end
end
