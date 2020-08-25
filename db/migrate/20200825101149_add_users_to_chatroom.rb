class AddUsersToChatroom < ActiveRecord::Migration[6.0]
  def change
    add_column :chatrooms, :sender_id, :integer
    add_column :chatrooms, :receiver_id, :integer
    remove_columns :chatrooms, :name
  end
end
