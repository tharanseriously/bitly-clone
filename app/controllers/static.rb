get '/' do
	@urls = Url.all.order(:id)
	@url = Url.new
	erb :"static/index"
end

post '/urls' do
	@urls =Url.all
	@url = Url.new(long_url: params[:long_url])

  @url.save

  @url.to_json
  "<tr>
    <td class='tab_row'>>#{@url.id}</td>
    <td class='tab_row'>>#{@url.long_url}</td>
    <td class='tab_row'>><a href= #{@url.short_url}>#{@url.short_url}</a></td>
    <td class='tab_row'>>#{@url.click_count}</td>
  <tr>"
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

