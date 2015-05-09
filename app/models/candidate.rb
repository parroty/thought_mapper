class Candidate < ActiveRecord::Base
  belongs_to :topic, counter_cache: true
  has_many :factors, dependent: :destroy
end
