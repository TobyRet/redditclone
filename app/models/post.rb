class Post < ActiveRecord::Base
  has_many :votes

  validates :title, presence: true
  validates :url, presence: true, format: { with: /\Ahttp/ }


  def votes_count
    votes.recent.up.count - votes.recent.down.count
  end

end
