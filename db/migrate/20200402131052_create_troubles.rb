class CreateTroubles < ActiveRecord::Migration[5.2]
  def change
    create_table :troubles do |t|

      t.string :title
      t.text :body
      t.string :image_id

      t.timestamps
    end
  end
end
