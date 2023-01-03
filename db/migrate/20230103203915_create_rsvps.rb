class CreateRsvps < ActiveRecord::Migration[7.0]
  def change
    create_table :rsvps do |t|
      t.references :attendee, foreign_key: { to_table: :users }, null: false, index: true
      t.references :attended_event, foreign_key: { to_table: :events }, null: false, index: true

      t.timestamps
    end
  end
end
