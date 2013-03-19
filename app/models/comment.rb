class Comment < ActiveRecord::Base
  attr_accessible :body, :post_id, :name

  belongs_to :post
  belongs_to :user
end