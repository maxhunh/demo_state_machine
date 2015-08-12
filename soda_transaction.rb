require 'rubygems'
require 'state_machine'

class SodaTransaction

  state_machine :soda_state, initial: :awaiting_selection do

    event :button_press do
      transition :awaiting_selection => :dispense_soda
    end

    event :labeling do
      transition :dispense_soda => :labeled
    end

  end

end