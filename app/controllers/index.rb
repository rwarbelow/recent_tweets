get '/' do
  erb :index
end

post '/create/user' do
  @user = TwitterUser.find_or_create_by_name(name: params[:name])
  if params[:followers]
    redirect "/followers/#{@user.name}"
  else
    redirect "/#{@user.name}"
  end
end

get '/:username' do
  @user = TwitterUser.find_by_name(params[:username])
  if @user.tweets.empty? || @user.tweets_stale?
    @load_wait = true
  else 
    @load_wait = false
    @tweets = @user.tweets.limit(200)
  end
  erb :tweets
end

post '/js/gettweets' do
  @user = TwitterUser.find_by_name(params[:username])
  @user.fetch_tweets!
  @tweets = @user.tweets.limit(200)
  erb :_tweets_partial
end

get '/followers/:username' do
  p "this works"
  @user = TwitterUser.find_by_name(params[:username])
  if @user.followers.empty? || @user.followers_stale?
    @load_wait = true
  else 
    @load_wait = false
    @followers = @user.followers.limit(200)
  end
  erb :followers
end

post '/js/getfollowers' do
  @user = TwitterUser.find_by_name(params[:username])
  @user.fetch_followers!
  @followers = @user.followers.limit(200)
  erb :_followers_partial
end
