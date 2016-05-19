class ClientPhone < ApplicationRecord
  belongs_to :client
  has_many :calls
  after_save :update_calls

  private

  def update_calls
    Call.where(phone: phone).each do |call|
      call.client = Client.find(client_id)
      call.save
    end
  end
end
