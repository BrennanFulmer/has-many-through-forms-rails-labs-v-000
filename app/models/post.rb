class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  
  accepts_nested_attributes_for :categories, reject_if: :empty_fields?
  
  def empty_fields?
binding.pry
    attributes['title'].blank?
  end

  def commenters
    commenters = []
    self.comments.each do |comment|
      commenters << comment.user
    end
    commenters.uniq
  end

end
