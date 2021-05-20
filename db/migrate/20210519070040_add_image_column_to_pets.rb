class AddImageColumnToPets < ActiveRecord::Migration[6.1]
  def change
    add_column :pets, :images, :json
  end
end
