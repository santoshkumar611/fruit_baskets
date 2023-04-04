class CreateBaskets < ActiveRecord::Migration[5.2]
  def change
    create_table :baskets do |t|
      t.integer :capacity
      t.string :fill_rate

      t.timestamps
    end
  end
end
