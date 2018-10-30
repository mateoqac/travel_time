class Journey < ApplicationRecord

  validates :leaving_time, :name, presence: true

  has_many :routes, inverse_of: :journey,  dependent: :destroy
  accepts_nested_attributes_for :routes, allow_destroy: true

  def get_init_time
    all_routes_time = self.routes.map{ |r| r.duration_in_minutes}
    self.leaving_time + all_routes_time.sum.minutes
  end
end
