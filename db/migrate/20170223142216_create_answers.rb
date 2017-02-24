class CreateAnswers < ActiveRecord::Migration
  def change

    create_table :answers do |t|
      t.string :answer
      t.integer :answerer_id
      t.references :question

      t.timestamps  null: false
    end
  end
end
