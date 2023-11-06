class CreateBadges < ActiveRecord::Migration[7.0]
  def change

    create_table :badges do |t|   #Creating a new table named badges in the database

      t.string :name
      t.string :description
      t.string :image_name

      t.timestamps
    end
  end
end
