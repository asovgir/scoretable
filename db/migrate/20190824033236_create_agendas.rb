class CreateAgendas < ActiveRecord::Migration[5.1]
  def change
    create_table :agendas do |t|
      t.string :agenda_item
      t.boolean :is_complete

      t.timestamps
    end
  end
end
