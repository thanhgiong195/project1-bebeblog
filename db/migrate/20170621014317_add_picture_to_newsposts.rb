class AddPictureToNewsposts < ActiveRecord::Migration[5.1]
  def change
    add_column :newsposts, :picture, :string
  end
end
