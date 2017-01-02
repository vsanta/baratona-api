class CreateBars < ActiveRecord::Migration[5.0]
  def change
    create_table :bars do |t|
      t.string :yelp_id
      t.string :name
      t.string :image_url

      t.timestamps
    end
  end
end
