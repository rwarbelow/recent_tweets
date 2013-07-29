class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.text :text
      t.integer :twitter_user_id
      t.timestamps
    end
  end
end
