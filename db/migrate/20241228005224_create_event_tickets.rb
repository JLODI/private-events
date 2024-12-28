class CreateEventTickets < ActiveRecord::Migration[8.0]
  def change
    create_table :event_tickets do |t|
      t.integer :attendee_id
      t.integer :attended_event_id

      t.timestamps
    end
  end
end
