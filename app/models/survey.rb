class Survey < ApplicationRecord
  has_many :responses, dependent: :destroy
  validates :question, presence: true

  def yes_count  = responses.where(answer: true).count
  def no_count   = responses.where(answer: false).count
  def total      = responses.count

  def pct_yes
    return 0 if total.zero?
    ((yes_count.to_f / total) * 100).round
  end

  def pct_no
    return 0 if total.zero?
    ((no_count.to_f / total) * 100).round
  end
end
