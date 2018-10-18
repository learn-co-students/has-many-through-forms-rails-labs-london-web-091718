class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories

  def uniq_users
    # self.comments.map {|c| c.user }.uniq
    users.uniq
  end

  # def uniq_users_with_comments
  #   rtn_hash = {}
  #   self.comments.each do |comment|
  #     rtn_hash[comment.user] ||= []
  #     rtn_hash[comment.user] << comment.content
  #   end
  #   rtn_hash
  # end
end
