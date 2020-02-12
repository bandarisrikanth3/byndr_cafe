class CreateChatroomUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :chatroom_users do |t|
      t.references :chatroom, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime   :last_read_at
      t.timestamps
    end
  end
end
