class User < ApplicationRecord
  has_one :profile
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
end
