require 'test/unit'
require_relative  '../lib/cheque_writer'
require_relative 'test_helper'

class ChequeWriterTest < Test::Unit::TestCase

  def setup

  end

  def teardown

  end


  def test_convert_number
    cic = Cheque.new('CIC')
    conv = ChequeWriter.new(cic, 134.60, 'amazon.com')
    assert_equal("cent trente-quatre Euros 60 cents ",conv.convert)
  end

  def test_cheque_new
    cic = Cheque.new('CIC')
    assert_instance_of(Array, cic.get_place_of_date)
    assert_instance_of(Fixnum, cic.get_place_of_date[0])
    assert_instance_of(Fixnum, cic.get_place_of_date[1])
  end

  def test_cheque_ville
    cic = Cheque.new('CIC')
    assert_equal('Corenc', cic.get_ville)
  end

end