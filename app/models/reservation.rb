class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  # 宿泊合計日数
  def amount_days
    total_days = (self.end_day - self.start_day).to_i
  end

  # 合計金額
  def amount_price
    total_price = (self.room.price * self.customer * self.total_days).to_i
  end

end
