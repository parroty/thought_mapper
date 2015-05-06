class ViewPoint < ActiveRecord::Base
  belongs_to :topic, counter_cache: true
  acts_as_list scope: :topic
end
