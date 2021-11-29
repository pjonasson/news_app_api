class ArticlesController < ApplicationController
  def index
    response = HTTP
      .headers("X-API-Key" => Rails.application.credentials.news_api_key)
      .get("https://newsapi.org/v2/everything?q=apple&from=2021-09-16&to=2021-09-16&sortBy=popularity")
    articles = JSON.parse(response.body)["articles"]
    render json: articles
  end
end
