class TwitterUser < ActiveRecord::Base
  # Remember to create a migration!
  has_many :tweets

  def fetch_tweets!
    tweets = Twitter.user_timeline(self.name, count: 10)
    tweets.each do |tweet|
      Tweet.find_or_create_by_text(text: tweet[:text], twitter_user_id: self.id)
    end
  end

  def tweets_stale?
    (Time.now - self.tweets.last[:created_at])/60 > 1
  end
end
