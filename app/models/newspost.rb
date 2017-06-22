class Newspost < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  mount_uploader :picture, PictureUploader

  validates :user_id, presence: true
  validates :title, presence: true,
    length: {maximum: Settings.newspost.title_size}
  validates :content, presence: true,
    length: {maximum: Settings.newspost.content_size}
  validate :picture_size

  scope :feed_sort, ->{order created_at: :desc}
  scope :load_feed, ->(id, following_ids) do
    where "user_id IN (#{following_ids}) OR user_id = :user_id",
      following_ids: following_ids, user_id: id
  end

  private

  def picture_size
    if picture.size > Settings.newspost.picture_size.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
