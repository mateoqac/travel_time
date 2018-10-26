class Journey < ApplicationRecord

  validates :leaving_time, :name, presence: true

  has_many :routes, inverse_of: :journey,  dependent: :destroy
  accepts_nested_attributes_for :routes, reject_if: :all_blank, allow_destroy: true  

end
