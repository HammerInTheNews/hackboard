class Post < ActiveRecord::Base
  attr_accessible :description, :link, :name, :avatar

  #validates with an 's' on the end.  then a ',' with what you want it to do
  validates :description, presence: true
  validates :link, presence: true,
  					#the part is regex "." is any character, * any number of times, + any character at least once, ? any char a single time or not
  					format:  /^http:\/\/.+\.com$/ 
  validates :user, presence: true
  validates_attachment :avatar, :presence => true, :content_type => { :content_type => ["image/jpeg", "image/png"]}
  
  has_attached_file :avatar, styles: { thumb: '60x60#', small: '150x150>', large: '300x300', ugly: '666x666!' },
                     size: { :in => 0..1000.kilobytes },
                                        storage: :s3,
                                        s3_credentials: {
                                        access_key_id: 'AKIAJNUSQQMYYELN5VZQ',
                                        secret_access_key: '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',
                                        bucket: 'hackeryou'
                                       }
  
  has_many :comments
  belongs_to :user
  
end
