class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.string :name
      t.integer :age
      t.text :description
      t.string :location
      t.string :breed
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
