class ViewPoint < ActiveRecord::Base
  belongs_to :topic, counter_cache: true
  has_many :factors, dependent: :destroy
  acts_as_list scope: :topic

  validates :title, presence: true, allow_blank: false
  validates :priority, presence: true, allow_blank: false
end
