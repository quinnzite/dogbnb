class ChangeAgeToString < ActiveRecord::Migration[5.2]
  def change
    change_column :dogs, :age, :string
  end
end
