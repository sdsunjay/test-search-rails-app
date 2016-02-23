class Post < ActiveRecord::Base
  searchkick
  #scope :search_import, -> { includes(:Location) }  
  belongs_to :user
  belongs_to :to, class_name: 'Location'
  belongs_to :from, class_name: 'Location'

  validates :title, presence: true
  validates :from, presence: true
  validates :to, presence: true
  validates :when_date, presence: { message: 'Departure date and time cannot be blank' }
  validates :user_id, presence: true

  accepts_nested_attributes_for :to, :from
  
  def search_data
  {
      title: title,
      when_date: when_date,
      from_id: from_id,
      to_id: to_id
  }
  end

end
