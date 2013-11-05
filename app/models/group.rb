class Group < ActiveRecord::Base
  has_many :memberships, foreign_key: "member_id", dependent: :destroy
  has_many :members, through: :memberships
end
