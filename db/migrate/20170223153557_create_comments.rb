class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string  :comment
      t.references :commentable, polymorphic: true, index: true
      t.integer :commentor_id
      t.timestamps null: false
    end
  end
end
