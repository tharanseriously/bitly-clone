get '/' do
	@urls = Url.all.order(:id)
	@url = Url.new
	erb :"static/index"
end

post '/urls' do
	@urls =Url.all.order(:id)
	@url = Url.new(long_url: params[:input_url])

	if @url.save
		redirect "/"
	else
		erb :"static/index"
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

