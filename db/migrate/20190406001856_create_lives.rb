class CreateLives < ActiveRecord::Migration[5.2]
  def change
    create_table :lives do |t|
      t.string :subject
      t.text :description
      t.references :author, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
