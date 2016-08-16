class CreateNetworks < ActiveRecord::Migration[5.0]
  def change
    create_table :networks do |t|
      t.string :name
      t.string :title
      t.text :content
      t.string :pwd
      t.string :ssid

      t.timestamps
    end
  end
end
