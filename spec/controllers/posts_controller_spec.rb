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

  describe "update" do
    it "updates a post" do
      post :create, params: { post: { message: "Hello, world!" } }
      post :update, params: { post: { message: "Edited new new post"} }
      # post.update(message: "Edited new new post")
      expect(post.message).to eq("Edited new new post")
    end
    it "updates a post correctly" do
      # p 'start'
      # p subject
      # p 'end'
      @post = Post.create(message: "Message1")
      expect { @post.update(message: "Message2") }.to change { @post.message }.from("Message1").to("Message2")
    end
    it "updates the requested post" do
      post = Post.create! valid_attributes
      put :update, params: {id: post.to_param, post: new_attributes}, session: valid_session
      post.reload
      skip("Add assertions for updated state")
    end
  end

  describe "/edit" do
    it "responds with 200" do
      get :index
      post :create, params: { post: { message: "Hello, world!" } }
      post :edit
      post :update, params: { post: { message: "new comment" } }
      expect(response).to have_http_status(200)
    end
  end

end
