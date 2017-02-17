class Task < ActiveRecord::Base
  
  validates :title, presence: true,
            uniqueness: {case_sensitive: false},
            length: {minimum: 5, maximum: 20}
  validates :description, presence: true,
            length: {minimum: 20, maximum 200}

end
