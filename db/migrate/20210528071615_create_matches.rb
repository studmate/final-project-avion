class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches do |t|
      t.references :requestor, null: false, foreign_key: { to_table: :pets }
      t.references :receiver, null: false, foreign_key: { to_table: :pets }
      t.boolean :status, default: false
      
      t.timestamps
    end
  end
end
