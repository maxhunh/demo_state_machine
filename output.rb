require './soda_transaction'
# require './vehicle'

sm = SodaTransaction.new
puts sm.soda_state
#=> awaiting selection

sm.button_press
puts sm.soda_state
#=> dispense soda

sm.labeling
puts sm.soda_state
#=> labeled