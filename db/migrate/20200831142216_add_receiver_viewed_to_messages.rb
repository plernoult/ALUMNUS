class AddReceiverViewedToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :receiver_viewed, :boolean
  end
end
