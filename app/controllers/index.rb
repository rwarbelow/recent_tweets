get '/' do
  erb :index
end

post '/create/user' do
  @user = TwitterUser.find_or_create_by_name(name: params[:name])

  redirect "/#{@user.name}"
end

get '/:username' do
  @user = TwitterUser.find_by_name(params[:username])
  if @user.tweets.empty? || @user.tweets_stale?
    @user.fetch_tweets!
  end
  @tweets = @user.tweets.limit(10)
  erb :tweets
end
