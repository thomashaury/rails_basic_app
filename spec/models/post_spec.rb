require 'rails_helper'
include RandomData

RSpec.describe Post, type: :model do
  # #1
  let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
# #4
 let(:post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }

 it { should belong_to(:topic) }

   describe "attributes" do
 # #2
     it "should respond to title" do
       expect(post).to respond_to(:title)
     end
 # #3
     it "should respond to body" do
       expect(post).to respond_to(:body)
     end
   end
end
