get '/' do
	@urls = Url.all.order(:id)
	erb :"static/index"
end

post '/urls' do
	url = Url.create(long_url: params[:input_url])

	if url.invalid?
		erb :"static/error"
	end

	# redirect "/"
end

get '/:short_url' do
	url = Url.find_by(short_url: params[:short_url])
	url.count

	unless url.nil?
		redirect url.long_url
	else
		redirect "/"
	end
end

