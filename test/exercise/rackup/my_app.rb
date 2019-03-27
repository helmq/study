Inatra.routes do
  get '/hello' do
    [200, {}, ['Hello World']]
  end

  post '/another_route' do
    [200, {}, ['Another Route']]
  end
end
