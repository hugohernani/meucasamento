class CreateEventParticipants < ActiveRecord::Migration[5.0]
  def change
    create_table :event_participants do |t|
      t.references :event, foreign_key: true, index: true
      t.references :participant, index: true, foreign_key: { to_table: :accounts }
      t.integer :event_role

      t.timestamps
    end
  end
end
