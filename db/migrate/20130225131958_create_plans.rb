class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.integer :searches
      t.timestamps
    end
  end
end
