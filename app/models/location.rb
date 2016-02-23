class Location < ActiveRecord::Base
  searchkick
  belongs_to :post
  validates :name, presence: true
  validates :state, presence: true
  validates :zip, presence: true

  def search_data
  {
      name: name
  }
  end
end
