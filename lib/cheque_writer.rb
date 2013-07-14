require 'numbers_and_words'
require 'prawn'
require 'date'
require_relative 'cheque'

class ChequeWriter
  attr_accessor :cheque, :amount , :beneficiaire

  def initialize(cheque, amount, beneficiaire)
    @cheque       = cheque
    @amount       = amount
    @beneficiaire = beneficiaire
  end

  def convert
    str =  I18n.with_locale(:fr) { self.amount.floor.to_words }
    str = str + ' Euros '  +  (((self.amount - self.amount.to_int).round 2)*100).to_int.to_s + ' cents '
  end

  def pad_with_stars(string, line_width)
     string.ljust(line_width,'*')
  end

  def generate_pdf(str)
    pdf = Prawn::Document.new
    pdf.draw_text str  , at: self.cheque.get_place_of_number
    pdf.draw_text self.beneficiaire , at: self.cheque.get_place_beneficiaire
    pdf.draw_text self.cheque.get_ville , at: self.cheque.get_place_ville
    pdf.draw_text DateTime.now.strftime("%d/%m/%Y") , at: self.cheque.get_place_of_date
    pdf.render_file "cheque.pdf"
  end
end

cic = Cheque.new('CIC')
conv = ChequeWriter.new(cic,28.95,'Tresor Public' )

puts str = conv.convert
puts str = conv.pad_with_stars(str, 50)
conv.generate_pdf(str)

