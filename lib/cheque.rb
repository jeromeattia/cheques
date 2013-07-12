class Cheque

  attr_accessor :banque

  def initialize(banque)
    @banque = banque
  end

  def get_place_of_date
    if self.banque == 'CIC'
      [100,100]
    elsif  self.banque == 'BNP'
      [150,100]
    end

  end

end