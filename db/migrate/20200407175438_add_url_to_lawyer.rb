class AddUrlToLawyer < ActiveRecord::Migration[5.2]
  def change
  	add_column :lawyers, :url, :string
  end
end