class CreateDoghomes < ActiveRecord::Migration[6.0]
  def change
    create_table :doghomes do |t|
      t.string :title
      t.text :description
      t.string :location
      t.float :price_per_day
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
