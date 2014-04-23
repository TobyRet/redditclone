class Post < ActiveRecord::Base
  has_many :votes
  belongs_to :user

  validates :title, presence: true
  validates :url, presence: true, format: { with: /\Ahttp/ }


  def votes_count
    votes.up.count - votes.down.count
  end

end
