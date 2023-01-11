class CreateServiceStations < ActiveRecord::Migration[7.0]
  def change
    create_table :service_stations do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :location
      t.string :type
      t.string :name
      t.string :description
      t.string :mobile

      t.timestamps
    end
  end
end
