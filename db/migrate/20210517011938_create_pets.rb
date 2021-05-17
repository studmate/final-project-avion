class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :breed
      t.string :specie
      t.boolean :vaccinated
      t.boolean :gender
      t.datetime :birthdate
      t.integer :age
      t.integer :user_id

      t.timestamps
    end
  end
end
