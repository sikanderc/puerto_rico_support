class User < ApplicationRecord
  has_secure_password

  has_many :posts
  has_many :comments
  has_many :user_organizations
  has_many :organizations, through: :user_organizations
  has_many :owned_organizations, class_name: 'Organization', foreign_key: "admin_id"


  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: {with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: "bad format"}

  # validates :phone, presence: true, length: {is: 10}
  validates :phone, format: { with: /\d{3}-\d{3}-\d{4}/, message: "bad format" }

  def to_s
    "#{first_name} #{last_name}"
  end

end
