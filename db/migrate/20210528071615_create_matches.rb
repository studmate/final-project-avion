class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches do |t|
      t.references :sent_by, null: false, foreign_key: { to_table: :pets }
      t.references :sent_to, null: false, foreign_key: { to_table: :pets }
      t.boolean :status, default: false
      
      t.timestamps
    end
  end
end
