class Post < ActiveRecord::Base
  attr_accessible :description, :link

  #validates with an 's' on the end.  then a ',' with what you want it to do
  validates :description, presence: true
  validates :link, presence: true,
  					#the part is regex "." is any character, * any number of times, + any character at least once, ? any char a single time or not
  					format:  /^http:\/\/.+\.com$/ 
  validates :user, presence: true
  

  has_many :comments
  belongs_to :user
  
end
