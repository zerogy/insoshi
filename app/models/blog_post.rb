# == Schema Information
# Schema version: 9
#
# Table name: posts
#
#  id                       :integer(11)     not null, primary key
#  blog_id                  :integer(11)     
#  topic_id                 :integer(11)     
#  person_id                :integer(11)     
#  title                    :string(255)     
#  body                     :text            
#  blog_post_comments_count :integer(11)     default(0), not null
#  type                     :string(255)     
#  created_at               :datetime        
#  updated_at               :datetime        
#

class BlogPost < Post
  belongs_to :blog
  has_many :comments, :class_name => "BlogPostComment",
                      :order => :created_at
  
  validates_presence_of :title, :body
  validates_length_of :title, :maximum => MAX_STRING_LENGTH
  validates_length_of :body, :maximum => MAX_TEXT_LENGTH
end