class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string  :value
      # creates votable_id & votable_type with t.references
      t.references :votable, polymorphic: true, index: true
      t.integer :voter_id

      t.timestamps null: false
    end
  end
end
