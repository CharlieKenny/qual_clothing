class AddPromocodeToCart < ActiveRecord::Migration
  def change
    add_column :carts, :promocode, :string
  end
end
