# db/migrate/XXXXXX_add_cascade_delete_to_purchases.rb
class AddCascadeDeleteToPurchases < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :purchases, :items
    add_foreign_key :purchases, :items, on_delete: :cascade
  end
end