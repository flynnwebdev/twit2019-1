class Tweet < ApplicationRecord
  resourcify
  belongs_to :user
  has_one_attached :image

  def can_edit?(user)
    return user == self.user || user.has_role?(:admin)
  end

  def can_destroy?(user)
    return user == self.user || user.has_role?(:admin) || user.has_role?(:moderator)
  end
end
