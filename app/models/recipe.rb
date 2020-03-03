class Recipe < ActiveRecord::Base
  has_many :ingredients
  accepts_nested_attributes_for :ingredients #, :reject_if => proc { |attributes| attributes['title'].blank? }

 # def ingredients_attributes=(ingredients_array)
 #   binding.pry
 #   ingredients_array.each do |key, val|
 #     self.ingredients.build(val)
 #     self.save
 #   end
 # end
end
