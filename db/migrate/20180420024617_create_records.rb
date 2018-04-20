class CreateRecords < ActiveRecord::Migration[5.1]

  def change
    create_table :records do |t|
      t.integer :wins
      t.integer :losses
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
