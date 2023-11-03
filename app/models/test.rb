class Test < ApplicationRecord
  belongs_to :category

  def self.tests_by_category(category_title)
    Category.where(title: category_title).map(&:tests).flatten
  end    
end
