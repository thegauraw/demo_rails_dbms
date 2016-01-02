class Club < ActiveRecord::Base
  has_many :players, dependent: :destroy
  belongs_to :sport
end
