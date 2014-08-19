class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string    :negativity
      t.integer   :rank
      
      t.timestamps
    end
  end
end
