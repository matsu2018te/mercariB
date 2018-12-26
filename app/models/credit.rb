class Credit < ApplicationRecord
  belongs_to :user, optional: true

  #正規表現
  VALID_CARDNUM_REGEX = /\A\d{14,16}\z/
  VALID_SECURITYCODE_REGEX = /\A\d{3,4}\z/

  time = Time.new
  min_year = time.year.to_s[2,2].to_i
  max_year = min_year + 10

  # バリデーション
  validates :expiration_month, presence: true, :numericality => { only_integer: true, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 12 }
  validates :expiration_year, presence: true, numericality: { only_integer: true, :greater_than_or_equal_to => min_year, :less_than_or_equal_to => max_year }
  validates :card_number, presence: true, uniqueness: true, format: { with: VALID_CARDNUM_REGEX }
  validates :security_code, presence: true, uniqueness: true, format: { with: VALID_SECURITYCODE_REGEX }

  def card_img
    card_numbers = card_number.split("")
    first_number = card_numbers[0].to_i
    digit  = card_numbers.length
    if digit == 14
      card_img = "dinersclub"
    elsif digit == 15
      card_img = "american_express"
    else digit == 16
      case first_number
      when 3
        card_img = "jcb"
      when 4
        card_img = "visa"
      when 5
        card_img = "master-card"
      end
    end
    return card_img
  end

  def low_four_digits
    regexp = /\d(?=(\d){4})/
    self.card_number = card_number.gsub(regexp, '*')
    return card_number
  end

  def month_number
    month = "0" + expiration_month.to_s
    return month
  end
end
