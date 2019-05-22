class RenameAdressToAddress < ActiveRecord::Migration[5.2]
  def change
     rename_column :restaurants, :address, :address
  end
end
