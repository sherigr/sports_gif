class RemoveFavoriteFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :favorite, :string
  end
end
