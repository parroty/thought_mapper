class Factor < ActiveRecord::Base
  belongs_to :topic, counter_cache: true
  belongs_to :candidate
  belongs_to :view_point

  class Score
    LOW    = 1
    MIDDLE = 2
    HIGH   = 3

    attr_reader :name, :value

    def initialize(name, value)
      @name  = name
      @value = value
    end

    def self.all
      constants.map do |name|
        Score.new(name.capitalize, const_get(name))
      end
    end

    def self.name_of(value)
      score = all.find { |s| s.value == value }
      score ? score.name.to_s : ""
    end
  end

  def self.scores_as_list
    Score.all.map { |score| [score.name, score.value] }
  end

  def score_name
    Score.name_of(score)
  end
end
