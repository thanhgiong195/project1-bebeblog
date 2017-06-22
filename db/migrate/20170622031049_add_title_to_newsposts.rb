class AddTitleToNewsposts < ActiveRecord::Migration[5.1]
  def change
    add_column :newsposts, :title, :string
  end
end
