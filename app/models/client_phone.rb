class ClientPhone < ApplicationRecord
  belongs_to :client
  has_many :calls
  after_save :update_calls

  scope :reverse_by_creation, -> { order('created_at desc') }

  private

  def update_calls
    Call.where(phone: phone).each do |call|
      call.client = Client.find(client_id)
      call.save
    end
  end
end
