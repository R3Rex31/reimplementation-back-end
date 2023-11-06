class CreateDuties < ActiveRecord::Migration[7.0]
  def change
    create_table :duties do |t|         #creating a new table named duties in the database
      t.string :name
      t.integer :max_members_for_duties

      t.timestamps
    end
  end
end
