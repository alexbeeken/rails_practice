class AddDescriptionToLists < ActiveRecord::Migration
  def change
    add_column :todos, :description, :string
  end
end
