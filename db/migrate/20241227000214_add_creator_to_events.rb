class AddCreatorToEvents < ActiveRecord::Migration[8.0]
  def change
    add_reference :events, :creator
  end
end
