class Customer < ApplicationRecord
  has_one_attached :image
  def self.ransackable_attributes(auth_object = nil)
    [ "id", "full_name", "phone_number", "email_address", "notes", "created_at", "updated_at", "image" ]
  end
  validates :full_name, presence: true
end
