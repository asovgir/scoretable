class AddOnDeleteCascadeToCategories < ActiveRecord::Migration[5.1]
  def change
  	remove_foreign_key :records, :categories
  	add_foreign_key :records, :categories, on_delete: :cascade
  end
end
