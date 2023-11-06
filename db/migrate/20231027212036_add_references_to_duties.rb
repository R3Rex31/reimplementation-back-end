class AddReferencesToDuties < ActiveRecord::Migration[7.0]
  #adding a reference assignment_id to the duties table, enforcing a relationship between duties and assignments 
  def change
    add_reference :duties, :assignment, null: false, foreign_key: true 
  end
end
