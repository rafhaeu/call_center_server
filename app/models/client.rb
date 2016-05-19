class Client < ApplicationRecord
  has_many :client_phones
  has_many :calls

  def self.phone_lookup(phone)
    cp = ClientPhone.where(phone: phone).first
    puts cp
    cp.nil? ? cp : cp.client
  end
end
