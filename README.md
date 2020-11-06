# 50.002-Checkoff 1
## Instructions
- io_button [1] is used to switch between manual and auto testing modes
- io_button[4] (next) and io_button[3] (back) are used to switch between states in the fsm input_controller during manual testing
- io_led[1:0] is used to display the inputs A, B and corresponding outputs depending on the current state.
- io_led[2][5:0] is used to display the current input of alufn
- io_led[2][7:6] is used to display the current input state
- The 7 segment display is used to reduce confusion by displaying information on the current state
## Manual Testing
- The ALU will start in manual testing mode with initial state S0
### In state S0,
- io_led [2][7] will be turned on while io_led[2][6] will be switched off
- io_dip[1:0] dip switches are used to input 16-bit A which will be fed into and saved by a dff called a_mem
- the state will change to S1 once io_button[4] is pressed
### In state S1,
- io_led [2][6] will be turned on while io_led[2][7] will be switched off
- io_dip[1:0] dip switches are used to input 16-bit A which will be fed into and saved by a dff called b_mem
- the state will change to S2 once io_button[4] is pressed
### In state S2,
- io_led [2][7:6] will both be turned on
- a mux is used to switch between the different modes as specified by alufn
- together with current alufn, the values of a and b saved in the previous clock cycle by dffs a_mem and b_mem respectively are fed accordingly into the selected module
- the output obtained is displayed on io_led[1:0]
- the state will return back to S0 once io_button[4] is pressed

## Auto Testing
- The ALU will procedurally input and check if the output of each module is correct
- All test cases will result in a correct answer except for the 15th one where an incorrect output is intentionally compared
- In this case, the fsm will enter ERROR state and display it on the 7 segments diplay
- The fsm will then return back to its initial state automatically and retry the test