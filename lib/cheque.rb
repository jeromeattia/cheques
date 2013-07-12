class Cheque

  attr_accessor :banque
  BANQUES ={
  CIC: {nombre: [100,100], place_date: [140,140], place_ville: [150,150] ,ville: 'Corenc',
        place_beneficiaire: [160,160]} ,
  BNP: {nombre: [120,120], place_date: [160,160],place_ville:  [150,150], ville: 'Echirolles',
        place_beneficiaire: [160,160]}
  }

  def initialize(banque)
    @banque = banque
  end

  def get_place_of_date
   BANQUES[self.banque.to_sym][:place_date]
  end

  def get_place_of_number
    BANQUES[self.banque.to_sym][:nombre]
  end

  def get_ville
    BANQUES[self.banque.to_sym][:ville]
  end

  def get_place_ville
    BANQUES[self.banque.to_sym][:place_ville]
  end

  def get_place_beneficiaire
    BANQUES[self.banque.to_sym][:place_beneficiaire]
  end

end