class Sport < ActiveRecord::Base
  has_many :clubs, dependent: :destroy
  validates :title, presence: true, length: {minimum: 4}
end
