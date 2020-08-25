class AddReceiverNameToChatrooms < ActiveRecord::Migration[6.0]
  def change
    add_column :chatrooms, :receiver_name, :string
  end
end
