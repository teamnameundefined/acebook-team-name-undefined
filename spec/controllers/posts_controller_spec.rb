require 'rails_helper'


RSpec.describe PostsController, type: :controller do

  # before (:each) do
  #   # @request.env["devise.mapping"] = Devise.mappings[:user]
  #   # user = FactoryBot.create(:user)
  #   # sign_in user
  #   user = FactoryBot.create(:user)
  #   user.save
  #   user.sign_in
  # end


  before(:each) do
    @user = create(:user)
    sign_in @user
  end

  describe "GET /new " do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    it "responds with 200" do
      post :create, params: { post: { message: "Hello, world!" } }
      expect(response).to redirect_to(posts_url)
    end

    it "creates a post" do
      post :create, params: { post: { message: "Hello, world!" } }
      expect(Post.find_by(message: "Hello, world!")).to be
    end
  end

  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe 'update' do
    it 'updates a post' do
      @post = Post.create(message: 'New new post')
      p @post.message
      @post.update(message: 'Edited new new post')
      p @post.message
      expect(@post.message).to eq('Edited new new post')
    end
  end
end
