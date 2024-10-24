require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  # Init data before testing
  before(:context) do
    @user = FactoryBot.create(:user)
    @articles = create_list(:approved_article, 3, user: @user)
    @article = @articles[0]
  end

  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "renders articles/index template" do
      get :index
      expect(response).to render_template(:index)
    end

    it "assigns @articles" do
      get :index
      expect(assigns(:articles)).to eq(@articles)
    end
  end

  describe "GET #show" do
    it "returns successful response" do
      get :show, params: { id: @article.id }
      expect(response).to have_http_status(:success)
    end

    it "render articles/show template" do
      get :show, params: { id: @article.id }
      expect(response).to render_template(:show)
    end

    it "assigns @article" do
      get :show, params: { id: @article.id }
      expect(assigns(:article)).to eq(@article)
    end
  end

  describe "POST #create" do
    context "when user is logged in" do
      before do
        sign_in @user
      end
      it "creates a new article" do
        post :create, params: { article: { title: "Sample title", body: "Sample body", visible: "public" }}
        expect(Article.count).to eq(4)
        expect(response).to redirect_to(Article.last)
      end
    end

    context "when user is not authenticated" do
      before do
        sign_out @user
      end
      it "require login before create a new article" do
        get :new, params: { locale: I18n.locale }
        expect(response).to redirect_to(:new_user_session)
      end
    end
  end

  describe "GET #new" do
    context "when user logged in" do
      before do
        sign_in @user
      end

      it "renders articles/new template" do
        get :new
        expect(response).to render_template(:new)
      end
    end

    context "when user doesn't log in" do
      before do
        sign_out @user
      end

      it "redirect to login" do
        get :new
        expect(response).to redirect_to(:new_user_session)
      end
    end
  end

  describe "GET #edit" do
    context "when user logged in" do
      it "render article/edit template" do
        get :edit, params: [id: @article.id]
        expect(response).to render_template(:edit)
        expect(assigns(:article)).to eq(@article)
      end
    end

    context "when user doesn't log in" do
      it "redirect to login" do
        get :edit, params: [id: @article.id]
        expect(response).to redirect_to(:new_user_session)
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
