class AddFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :current_city, :string
    add_column :users, :batch_number, :integer
    add_column :users, :batch_date, :date
    add_column :users, :occupation, :string
    add_column :users, :company_name, :string
    add_column :users, :ghost_mode, :boolean
  end
end
