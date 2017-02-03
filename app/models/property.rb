class Property < ActiveRecord::Base
  validates :name, presence: true,
            uniqueness: {case_sensitive: false},
            length: {minimum: 5, maximum: 30}
  validates :cost, presence: true,
            length: {minimum: 3, maximum: 8}
  validates :address, presence: true,
            length: {minimum: 15, maximum: 120}
  validates :sqFootage, presence: true,
            length: {minimum: 3, maximum: 10}
  validates :acres, presence: true,
            length: {maximum: 10}

end
