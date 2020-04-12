class AddLatitudeToLawyer < ActiveRecord::Migration[5.2]
  def change
  	add_column :lawyers, :latitude, :float
    add_column :lawyers, :longitude, :float
  end
end
