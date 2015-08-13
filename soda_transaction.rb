require 'rubygems'
require 'state_machine'

class SodaTransaction

  attr_accessor :selection

  state_machine :soda_state, initial: :awaiting_selection do

    # After do button_press will do testing_v1
    after_transition :on => :button_press, :do => :testing_v1


    event :button_press do
      transition :awaiting_selection => :dispense_soda
    end

    event :testing_v1 do
      transition :dispense_soda => :tested_v1
    end

    event :testing_v2 do
      transition :tested_v1 => :tested_v2
    end

    event :labeling do
      transition :dispense_soda => :labeled
    end

    state :awaiting_selection do
      @status = 'uncheck'
    end

    # TODO: shorting code
    state :dispense_soda do
      def status
        'waiting dispense'
      end
    end

    state :tested_v1 do
      def status
        'test basic'
      end
    end

    state :tested_v2 do
      def status
        'test pro'
      end
    end

    state :labeled do
      def status
        'checked'
      end
    end

  end

  def button_press(selection)
    @selection = selection
    super
  end

end