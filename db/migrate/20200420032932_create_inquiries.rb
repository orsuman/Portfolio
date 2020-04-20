class CreateInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiries do |t|

      t.integer :subject
      t.string :email
      t.string :send_email
      t.string :name
      t.string :name_kana
      t.boolean :sex
      t.boolean :is_user
      t.text :content

      t.timestamps
    end
  end
end
