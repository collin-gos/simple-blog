require 'rails_helper'

RSpec.describe 'Article endpoints', type: :request do
  before(:context) do
    @user = FactoryBot.create(:user)
    @articles = create_list(:approved_article, 3, user: @user)
    @article = @articles[0]
  end

  describe "get /articles" do
    it "returns a successful response" do
      get '/articles'
      expect(response).to have_http_status(:success)
    end

    it "renders articles/index template" do
      get '/articles'
      expect(response).to render_template(:index)
    end

    it "assigns @articles" do
      get '/articles'
      expect(assigns(:articles)).to eq(@articles)
    end
  end

  describe "GET /articles/:id" do
    it "returns successful response" do
      get article_path(@article.id)
      expect(response).to have_http_status(:success)
    end

    it "render articles/show template" do
      get article_path(@article.id)
      expect(response).to render_template(:show)
    end

    it "assigns @article" do
      get article_path(@article.id)
      expect(assigns(:article)).to eq(@article)
    end
  end

  describe 'POST /articles' do
    context 'with valid parameters' do
      before do
        post user_session_path, params: { user: { email: @user.email, password: 'password123' } }
      end

      it 'creates a new article' do
        expect {
          post '/articles', params: { article: {title: "New article", body: "New article's conent", visible: "public" }}
        }.to change(Article, :count).by(1)

        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(article_url(Article.last, params: {locale: I18n.locale}))
      end
    end
  end

  after(:context) do
    @articles.each do |article|
      article.destroy
    end
    @user.destroy
  end
end
