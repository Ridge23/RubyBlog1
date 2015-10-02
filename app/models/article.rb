class Article < ActiveRecord::Base
  acts_as_taggable

  validates :title, presence: true
  validates :body, presence: true
  validates :user_id, presence: true

  belongs_to :user
end
