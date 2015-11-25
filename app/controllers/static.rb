get '/' do
	puts "[LOG] Getting /"
	puts "[LOG] Params: #{params.inspect}"
	@urls = Url.all
	erb :"static/index"
end

post '/urls' do
	url = Url.create(long_url: params[:input_url])

	redirect "/"
end

get '/:short_url' do
	url = Url.find_by(short_url: params[:short_url])

	unless url.nil?
		redirect url.long_url
	else
		redirect "/"
	end
end