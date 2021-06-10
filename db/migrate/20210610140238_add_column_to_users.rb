class AddColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :distance, :integer
  end
end
