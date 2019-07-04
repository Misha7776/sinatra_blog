class Post
  include Mongoid::Document

  field :title, type: String
  field :content, type: String

  validates :content, presence: :true

  belongs_to :user
end
