class AddCompetitorToRecords < ActiveRecord::Migration[5.1]
  def change
  	add_column :records, :competitor_user_id, :int
  end
end