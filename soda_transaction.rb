require 'rubygems'
require 'state_machine'

class SodaTransaction

  attr_accessor :selection

  state_machine :soda_state, initial: :awaiting_selection do

    event :button_press do
      transition :awaiting_selection => :dispense_soda
    end

    event :labeling do
      transition :dispense_soda => :labeled
    end

  end

  def button_press(selection)
    @selection = selection
    super
  end

end