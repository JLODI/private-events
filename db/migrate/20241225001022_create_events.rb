class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :events do |t|
      t.string :name
      t.text :desc
      t.date :date
      t.string :location
      t.string :image_url

      t.timestamps
    end
  end
end
