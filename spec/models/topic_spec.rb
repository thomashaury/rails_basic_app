require 'rails_helper'
include RandomData

RSpec.describe Topic, type: :model do
  let(:topic) { create(:topic) }

 it { should have_many(:posts) }

 it { is_expected.to have_many(:labelings) }
# #10
  it { is_expected.to have_many(:labels).through(:labelings) }
 # #1
   describe "attributes" do
     it "should respond to name" do
      expect(topic).to have_attributes(name: topic.name, description: topic.description)
     end

     it "should respond to description" do
       expect(topic).to respond_to(:description)
     end

     it "should respond to public" do
       expect(topic).to respond_to(:public)
     end

 # #2
     it "should be public by default" do
       expect(topic.public).to be(true)
     end
   end
end
