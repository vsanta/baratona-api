class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name, presence: true
      t.string :description
      t.date :date
      t.time :time
      t.integer :user_id
      t.timestamps
    end
  end
end
