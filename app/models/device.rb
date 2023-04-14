class Device < ApplicationRecord
  acts_as_paranoid

  belongs_to :category, optional: true
  belongs_to :office
  belongs_to :brand, optional: true
  belongs_to :parent_device, class_name: Device.name, optional: true

  has_many :sub_devices, class_name: Device.name, dependent: :destroy
  has_many :device_histories, dependent: :destroy
  has_many :user_devices, dependent: :destroy
  has_many :requests, dependent: :destroy

  enum status: {ready: 0, fixing: 1, using: 2}
end
