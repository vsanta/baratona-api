class ChangeDateAndTIimeToDateTimeColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :date, :date
    remove_column :events, :time, :time
    add_column :events, :date, :datetime
  end
end
