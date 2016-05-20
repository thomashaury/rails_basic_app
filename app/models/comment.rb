class Comment < ActiveRecord::Base
  has_many :commentings
# #4
  has_many :topics, through: :commentings, source: :commentable, source_type: :Topic
# #5
  has_many :posts, through: :commentings, source: :commentable, source_type: :Post

  belongs_to :post
  belongs_to :user

   validates :body, length: { minimum: 5 }, presence: true
   validates :user, presence: true

   def self.update_comments(comment_string)
 # #24
     return Comment.none if comment_string.blank?

 # #25
     comment_string.split(",").map do |comment|
       Comment.find_or_create_by(name: comment.strip)
     end
   end
   after_create :send_favorite_emails

   private

   def send_favorite_emails
     post.favorites.each do |favorite|
       FavoriteMailer.new_comment(favorite.user, post, self).deliver_now
     end
   end
end
