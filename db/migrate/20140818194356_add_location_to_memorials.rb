class AddLocationToMemorials < ActiveRecord::Migration
  def change
  	add_column :memorials, :service_location, :string
  end
end
