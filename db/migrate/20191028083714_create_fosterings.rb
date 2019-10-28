class CreateFosterings < ActiveRecord::Migration[5.2]
  def change
    create_table :fosterings do |t|
      t.references :user, foreign_key: true
      t.references :dog, foreign_key: true
      t.references :review, foreign_key: true
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
