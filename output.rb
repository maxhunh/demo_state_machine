require './soda_transaction'

sm = SodaTransaction.new
puts sm.soda_state
#=> awaiting selection

sm.button_press
puts sm.soda_state
#=> dispense soda

sm.labeling
puts sm.soda_state
#=> checked

# OVERWRITE BUTTON_PRESS
sm.button_press('coca')
puts sm.selection
puts sm.soda_state
#=> dispense soda


# USING HOOK
sm.button_press('coca')
puts sm.selection
puts sm.soda_state
#=> tested_v1