# require 'rails_helper'


# RSpec.describe PostsController, type: :controller do

#   # before (:each) do
#   #   # @request.env["devise.mapping"] = Devise.mappings[:user]
#   #   # user = FactoryBot.create(:user)
#   #   # sign_in user
#   #   user = FactoryBot.create(:user)
#   #   user.save
#   #   user.sign_in
#   # end


#   before(:each) do
#     @user = create(:user)
#     sign_in @user
#   end

#   describe "GET /new " do
#     it "responds with 200" do
#       get :new
#       expect(response).to have_http_status(200)
#     end
#   end

#   describe "POST /" do
#     it "responds with 200" do
#       post :create, params: { post: { message: "Hello, world!" } }
#       expect(response).to redirect_to(posts_url)
#     end

#     it "creates a post" do
#       post :create, params: { post: { message: "Hello, world!" } }
#       expect(Post.find_by(message: "Hello, world!")).to be
#     end
#   end

#   describe "GET /" do
#     it "responds with 200" do
#       get :index
#       expect(response).to have_http_status(200)
#     end
#   end

#   describe "update" do
#     it "updates a post" do
#       post :create, params: { post: { message: "Hello, world!" } }
#       post :update, params: { post: { message: "Edited new new post"} }
#       # post.update(message: "Edited new new post")
#       expect(post.message).to eq("Edited new new post")
#     end
#     it "updates a post correctly" do
#       # p 'start'
#       # p subject
#       # p 'end'
#       @post = Post.create(message: "Message1")
#       expect { @post.update(message: "Message2") }.to change { @post.message }.from("Message1").to("Message2")
#     end
#     it "updates the requested post" do
#       post = Post.create! valid_attributes
#       put :update, params: {id: post.to_param, post: new_attributes}, session: valid_session
#       post.reload
#       skip("Add assertions for updated state")
#     end
#   end

#   describe "/edit" do
#     it "responds with 200" do
#       get :index
#       post :create, params: { post: { message: "Hello, world!" } }
#       post :edit
#       post :update, params: { post: { message: "new comment" } }
#       expect(response).to have_http_status(200)
#     end
#   end

# end
require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe PostsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Post. As you add validations to Post, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    # skip("Add a hash of attributes valid for your model")
    { message: 'message' }
  }

  let(:invalid_attributes) {
    # skip("Add a hash of attributes invalid for your model")
    { message: 'a' }
  }

  before(:each) do
    @user = create(:user)
    sign_in @user
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PostsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      Post.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      post = Post.create! valid_attributes
      get :edit, params: {id: post.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Post" do
        expect {
          post :create, params: {post: valid_attributes}, session: valid_session
        }.to change(Post, :count).by(1)
      end

      it "redirects to all posts" do
        post :create, params: {post: valid_attributes}, session: valid_session
        expect(response).to redirect_to(posts_url)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {post: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        # skip("Add a hash of attributes valid for your model")
        { message: 'edited' }
      }

      it "updates the requested post" do
        post = Post.create! valid_attributes
        put :update, params: {id: post.to_param, post: new_attributes}, session: valid_session
        post.reload
        # skip("Add assertions for updated state")
        expect(post.message).to eq('edited')
      end

      it "redirects to all posts" do
        post = Post.create! valid_attributes
        put :update, params: {id: post.to_param, post: valid_attributes}, session: valid_session
        expect(response).to redirect_to(posts_url)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        post = Post.create! valid_attributes
        put :update, params: {id: post.to_param, post: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested post" do
      post = Post.create! valid_attributes
      expect {
        delete :destroy, params: {id: post.to_param}, session: valid_session
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the posts list" do
      post = Post.create! valid_attributes
      delete :destroy, params: {id: post.to_param}, session: valid_session
      expect(response).to redirect_to(posts_url)
    end
  end
end