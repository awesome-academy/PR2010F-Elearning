class Category < ApplicationRecord
  has_many :courses
  has_one_attached :img_category
  def avatar_thumbnail
    if img_category.attached?
      img_category.variant(resize: "150x150!").processed
    else
      "/assets/adefault.svg"
    end
  end
end
