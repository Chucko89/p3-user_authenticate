get '/' do
  # render home page
 #TODO: Show all users if user is signed in
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page 
  erb :sign_in
end

post '/sessions' do
  # sign-in
  user = User.authenticate(params[:email], params[:password])
  if user
  	session[:user_id] = user.id
  end
  	redirect '/'
end

delete '/sessions/:id' do
	 session.clear
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  erb :sign_up
end

post '/users' do
  # sign-up a new user
  user = User.new(name: params[:user][:name], email: params[:user][:email])
  user.password= params[:user][:password]
  user.save!
  session[:user_id] = user.id
  redirect '/'


end
