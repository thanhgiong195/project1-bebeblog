class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :newspost

  validates :user_id, presence: true
  validates :content, presence: true, length:
     {maximum: Settings.comment.comment_max_size}

  scope :comment_sort, ->{order created_at: :desc}
end
