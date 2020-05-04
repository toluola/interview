class CreateHolidays < ActiveRecord::Migration[6.0]
  def change
    create_table :holidays do |t|
      t.date :day
      t.integer :kind, default: 0 

      t.timestamps
    end
  end
end
