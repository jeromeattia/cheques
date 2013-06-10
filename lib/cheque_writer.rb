require 'numbers_and_words'
require 'prawn'

class ChequeWriter


  def convert(number)
    str =  I18n.with_locale(:fr) { number.floor.to_words }
    str = str + ' Euros '  +  (((number - number.to_int).round 2)*100).to_int.to_s + ' cents '

  end

  def pad_with_stars(string, line_width)
     string.ljust(line_width,'*')
  end

  def generate_pdf(str)
    pdf = Prawn::Document.new
    pdf.text str
    pdf.render_file "cheque.pdf"
  end
end

conv = ChequeWriter.new

puts str = conv.convert(134.60)
puts str = conv.pad_with_stars(str, 50)
conv.generate_pdf(str)
