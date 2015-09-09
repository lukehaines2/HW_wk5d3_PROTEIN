class CreatingNewColumn < ActiveRecord::Migration
  def change
    add_column :proteins, :description, :string
  end
end
