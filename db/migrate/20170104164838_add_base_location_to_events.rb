class AddBaseLocationToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :base_location, :string
  end
end
