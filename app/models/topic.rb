class Topic < ActiveRecord::Base
   has_many :posts, dependent: :destroy
   has_many :sponsored_posts
   has_many :labelings, as: :labelable
 # #13
   has_many :labels, through: :labelings

   has_many :commentings, as: :commentable
 # #13
   has_many :comments, through: :commentings

   validates :name, length: { minimum: 5 }, presence: true
   validates :description, length: { minimum: 15 }, presence: true
end
