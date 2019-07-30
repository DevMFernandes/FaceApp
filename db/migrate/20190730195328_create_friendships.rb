class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.references :creator, index: true
      t.references :recipient, index: true
      t.boolean :status

      t.timestamps null: false
    end
    add_foreign_key :friendships, :users, column: :recipient_id
    add_foreign_key :friendships, :users, column: :creator_id
  end
end
