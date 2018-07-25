class Call < ApplicationRecord
  belongs_to :internal
  belongs_to :call_type
  belongs_to :client
  before_save :find_client

  validates_presence_of :phone, :called_at, :duration, :internal, :call_type


  scope :client, -> (client) { where client: client }
  scope :ordering, -> { where(internal: sector_internals) }
  # scope :phone_called_at_order, -> { order('phone, called_at desc') }
  scope :phone_called_at_order, -> { order('phone, called_at desc') }
  scope :all_with_ordering, -> { order('called_at desc') }

  scope :today, -> do
    today = Time.now.beginning_of_day
    where("called_at > ?", today)
  end

  def self.ordering_last_ones
    today.all_with_ordering.ordering.first(70)
  end

  def self.sector_internals
    Internal.where(sector: 1)
  end

  private 


  def find_client
    ClientPhone.find_by(phone: phone)
  end

  def not_responded?
    call_type_id == 2 && duration == 0
  end
end
