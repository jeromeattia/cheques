# encoding: utf-8
#
# Helper for organizing examples
#

require 'prawn'
require 'prawn/security'
require 'prawn/layout'

require 'enumerator'



  # The Prawn::Example class holds all the helper methods used to generate the
  # Prawn by example manual.
  #
  # The overall structure is to have single example files grouped by package
  # folders. Each package has a package builder file (with the same name as the
  # package folder) that defines the inner structure of subsections and
  # examples. The manual is then built by loading all the packages and some
  # standalone pages.
  #
  # To see one of the examples check manual/basic_concepts/cursor.rb
  #
  # To see one of the package builders check
  # manual/basic_concepts/basic_concepts.rb
  #
  # To see how the manual is built check manual/manual/manual.rb (Yes that's a
  # whole load of manuals)
  #
  class  Prawn::Document
    
    # Values used for the manual design:
    
    # This is the default value for the margin box
    #
    BOX_MARGIN   = 36
    
    # Additional indentation to keep the line measure with a reasonable size
    # 
    INNER_MARGIN = 30
    
    # Vertical Rhythm settings
    #
    RHYTHM  = 10
    LEADING = 2
    
    # Colors
    #
    BLACK      = "000000"
    LIGHT_GRAY = "F2F2F2"
    GRAY       = "DDDDDD"
    DARK_GRAY  = "333333"
    BROWN      = "A4441C"
    ORANGE     = "F28157"
    LIGHT_GOLD = "FBFBBE"
    DARK_GOLD  = "EBE389"
    BLUE       = "0000D0"
    

    
    # Draws X and Y axis rulers beginning at the margin box origin. Used on
    # examples.
    #
    def stroke_axis(options={})
      options = { :height => (cursor - 20).to_i,
                  :width => bounds.width.to_i
                }.merge(options)
      
      dash(1, :space => 4)
      stroke_horizontal_line(-21, options[:width], :at => 0)
      stroke_vertical_line(-21, options[:height], :at => 0)
      undash
      
      fill_circle [0, 0], 1
      
      (100..options[:width]).step(100) do |point|
        fill_circle [point, 0], 1
        draw_text point, :at => [point-5, -10], :size => 7
      end

      (100..options[:height]).step(100) do |point|
        fill_circle [0, point], 1
        draw_text point, :at => [-17, point-2], :size => 7
      end
    end
    
    # Reset some of the Prawn settings including graphics and text to their
    # defaults.
    # 
    # Used after rendering examples so that each new example starts with a clean
    # slate.
    #

  end

