class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :user_id, presence: true  
  belongs_to :user  
  validates :image, presence: true
  validates :caption, presence: true, length: { minimum: 3, maximum: 300 }  
  
  has_attached_file :image, styles: { medium: "640x", thumb: "100x100>" }
  # , default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  
end
