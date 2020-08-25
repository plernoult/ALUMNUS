class AddSenderNameToChatrooms < ActiveRecord::Migration[6.0]
  def change
    add_column :chatrooms, :sender_name, :string
  end
end
