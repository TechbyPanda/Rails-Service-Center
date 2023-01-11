class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :service_stations, :type, :works
  end
end
