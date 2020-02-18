class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :images, dependent: :destroy
  belongs_to :user, optional: true
  belongs_to :category, optional: true
  has_one :delivery
  has_one :todo
  belongs_to_active_hash :condition
  belongs_to_active_hash :payer
  belongs_to_active_hash :shippingaddress
  belongs_to_active_hash :shippingdate
  belongs_to_active_hash :size
  
  validates :name, presence: true
  validates :detail, presence: true
  validates :size, presence: true
  validates :price, presence: true
  validates :condition, presence: true
  validates :shippingaddress, presence: true
  validates :shippingdate, presence: true
  validates :payer, presence: true  
  validates :user_id, presence: true
  validates :category_id, presence: true
  validates :images, presence: true
  

  accepts_nested_attributes_for :images, allow_destroy: true
end
