class CreateOranges < ActiveRecord::Migration[5.2]
  def change
    create_table :oranges do |t|
      t.references :basket, foreign_key: true
      t.string :variety

      t.timestamps
    end
  end
end
