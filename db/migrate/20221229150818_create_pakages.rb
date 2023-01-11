class CreatePakages < ActiveRecord::Migration[7.0]
  def change
    create_table :pakages do |t|
      t.belongs_to :service_station, null: false, foreign_key: true
      t.string :name
      t.integer :price
      t.string :description

      t.timestamps
    end
  end
end
