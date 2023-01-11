class AddForeignKey < ActiveRecord::Migration[7.0]
  def change
    add_reference :service_center_owners, :user, index: true
  end
end
