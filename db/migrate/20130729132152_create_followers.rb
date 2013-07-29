class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.integer :twitter_user_id
      t.string :user_name
      t.string :full_name
      t.timestamps
    end
  end
end
