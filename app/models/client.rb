class Client < ApplicationRecord
  has_many :client_phones
  has_many :calls

  scope :reverse_by_creation, -> { order('created_at desc') }

  def self.phone_lookup(phone)
    cp = ClientPhone.where(phone: phone).first
    puts cp
    cp.nil? ? cp : cp.client
  end

  def self.search(search)
    return all unless search
    where(
      'cast(id as text) LIKE :search OR name ILIKE :search',
      search: "%#{search}%"
    )
  end
end
