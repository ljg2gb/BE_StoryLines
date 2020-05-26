class CreatePoints < ActiveRecord::Migration[6.0]
  def change
    create_table :points do |t|
      t.string :name
      t.string :post
      t.string :latlng
      t.references :story, null: false, foreign_key: true

      t.timestamps
    end
  end
end
