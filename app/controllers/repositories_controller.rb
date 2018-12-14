class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = '413a41b9d44c6a2757b2'
    client_secret = '7cba8d802e5d3942f961eb7e2ebe1889ef6b952b'
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = client_id
      req.params['client_secret'] = client_secret
      req.params['q'] = params[:query]
    end

    body = JSON.parse(@resp.body)

    render 'search'
  end
end
