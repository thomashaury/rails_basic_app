include RandomData
# Create Users
 5.times do
   User.create!(
 # #3
   name:     RandomData.random_name,
   email:    RandomData.random_email,
   password: RandomData.random_sentence
   )
 end
 users = User.all

# Create Topics
 15.times do
   Topic.create!(
     name:         RandomData.random_sentence,
     description:  RandomData.random_paragraph
   )
 end
 topics = Topic.all

 # Create Posts
 50.times do
 # #1
   Post.create!(
 # #2
     user:   users.sample,
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph,
     topic: topics.sample
   )
 end
 posts = Post.all

 #Create SponsoredPosts
50.times do

  SponsoredPost.create!(

    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end
sponsoredposts = SponsoredPost.all

50.times do

  Advertisement.create!(

    title: RandomData.random_sentence,
    copy: RandomData.random_paragraph
  )
end
advertisements = Advertisement.all
 # Create Comments
 # #3
 100.times do
   Comment.create!(
 # #4
     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end

 Post.find_or_create_by(title: "Obama... he got us a phone", body: "He goin do more")

 user = User.first
  user.update_attributes!(
    email: 'thomashaury@yahoo.com', # replace this with your personal email
    password: 'helloworld'
  )

 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Topic.count} topics created"
 puts "#{Post.count} posts created"
 puts "#{SponsoredPost.count} sponsoredposts created"
 puts "#{Comment.count} comments created"
