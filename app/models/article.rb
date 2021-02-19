class Article < ApplicationRecord
  mount_uploader :picture, PictureUploader

  default_scope -> { order(created_at: :desc) }

  validates :title, presence: true
  validates :content, presence: true

  def self.search(search)
    if search
      where(['title LIKE ?', "%#{search}%"])
    else
      all
    end
  end
end
