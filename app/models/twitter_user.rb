class TwitterUser < ActiveRecord::Base
  # Remember to create a migration!
  has_many :tweets
  has_many :followers

  def fetch_tweets!
    tweets = Twitter.user_timeline(self.name, count: 200)
    tweets.each do |tweet|
      Tweet.find_or_create_by_text(text: tweet[:text], twitter_user_id: self.id)
    end
  end

  def tweets_stale?
    (Time.now - self.tweets.last[:created_at])/60 > 15
  end

  def fetch_followers!
    followers = Twitter.followers(self.name)
    followers.each do |follower|
      Follower.find_or_create_by_user_name(user_name: follower[:screen_name], full_name: follower[:name], twitter_user_id: self.id)
    end
  end

  def followers_stale?
    (Time.now - self.followers.last[:created_at])/60 > 15
  end

end
