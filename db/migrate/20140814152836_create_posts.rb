class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :author_id
      t.integer :memorial_id
      t.boolean :approved, default: true
      t.string :text
      t.integer :status
      t.string :state

      t.timestamps
    end
  end
end
