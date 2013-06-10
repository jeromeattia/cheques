require 'test/unit'
require_relative  '../lib/cheque_writer'

class ChequeWriterTest < Test::Unit::TestCase

  def setup

  end

  def teardown

  end


  def test_convert_number
    conv = ChequeWriter.new
    assert_equal("cent trente-quatre Euros 60 cents ",conv.convert(134.60))
  end
end