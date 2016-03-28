class Car < ActiveRecord::Base
	validates :brand, :model, :color, presence: true
	validates :model_year, numericality: { only_integer: true, :greater_than => 1930 }
end
