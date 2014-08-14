class CreateMemorials < ActiveRecord::Migration
  def change
    create_table :memorials do |t|
      t.integer :moderator_id
      t.string :deceased_name
      t.datetime :date_of_birth
      t.datetime :date_of_death
      t.text :obituary_description
      t.text :service_description

      t.timestamps
    end
  end
end
