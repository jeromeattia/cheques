require 'numbers_and_words'
require 'prawn'
require 'date'
require_relative 'cheque'

class ChequeWriter
  attr_accessor :cheque, :amount

  def initialize(cheque, amount)
    @cheque = cheque
    @amount = amount
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
    pdf.text str
    pdf.text "Corenc"
    pdf.draw_text DateTime.now.strftime("%d/%m/%Y") , at: self.cheque.get_place_of_date
    pdf.render_file "cheque.pdf"
  end
end

cic = Cheque.new('CIC')
conv = ChequeWriter.new(cic,134.60 )

puts str = conv.convert
puts str = conv.pad_with_stars(str, 50)
conv.generate_pdf(str)

#TODO demander beneficiaire et somme
#TODO formater sortie (selon Banque ?)
