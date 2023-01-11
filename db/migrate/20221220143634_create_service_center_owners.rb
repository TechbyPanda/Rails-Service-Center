class CreateServiceCenterOwners < ActiveRecord::Migration[7.0]
  def change
    create_table :service_center_owners do |t|
      t.string :name
      t.string :address
      t.string :state
      t.string :city
      t.string :country
      t.string :description
      t.string :gender
      t.string :Occupation
      t.string :mobile

      t.timestamps
    end
  end
end
