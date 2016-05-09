require 'rails_helper'

RSpec.describe SponsoredPostsController, type: :controller do

  describe "GET #show" do
    let(:topic) { Topic.create! name: 'fooasdfasdf', description: 'asdf asdf asdfasdf sadf ds'}
    let(:post) { SponsoredPost.create! title: 'Asdfasdfasdfsdaf', body: 'asfd asdf asdfasdfasdf ', price: 100, topic_id: topic.id }

    it "returns http success" do
      get :show, topic_id: topic.id, id: post.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    let(:topic) { Topic.create! name: 'fooasdfasdf', description: 'asdf asdf asdfasdf sadf ds'}

    it "returns http success" do
      get :new, topic_id: topic.id
      expect(response).to have_http_status(:success)
    end
  end


end
