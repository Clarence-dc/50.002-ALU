# The 64
# 50.002 Team 13-4

## Description

This game of 64 is a modified version of the popular 2048 mobile game. The gameboard consists of a 3x3 2-digit grid, 4 directional buttons, 1 reset button and the 7-segment LED of the FPGA used to display the number of moves the player has made. The player starts by pressing one of the directional buttons to randomly pick a grid to spawn the number ‘1’. The player must then merge numbers of equal value until they reach the number ‘64’. The player loses if the entire grid is filled (no zeroes) and there are no numbers of equal value that are adjacent to one another.

## How to play

1. To start, press any of the buttons except the reset button
2. Move the tiles by pressing the up,down left or right button once
3. Upon moving, a random tile pops up anywhere
4. When two tiles with the same number on them collide with one another as you move them, they will merge into one tile with the sum of the numbers written on them initially. 
5. To win, you will need to merge the tiles until u get the tile with 64 
6.  Player loses once tiles cannot merge and move around.
7.  To restart the game, press the restart button (Yellow button)
