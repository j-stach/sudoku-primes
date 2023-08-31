# sudoku-primes
Doing this to get some experience with Lua. May make it into a prime-verifying algorithm if it yields anything good.<br>

### Try me
To setup, clone the repo to the desired location and `cd` there.<br>
You should also install Lua if you don't already have it.<br>

To use, run the script `proto/main.lua` while in this directory, 
with a number between 2 and 30 as an argument:<br>
``` 
lua proto/main.lua 13 
```

### How I work
I create a numeric system using the argument as the digital base,
representing digits greater than 9 as a letter between "A" and "T".<br>
Then I generate a square matrix up to the "zenith" digit,
which is the greatest single digit in the number system.<br>
I multiply each row by each column, using the mod (%) of the zenith 
to calculate the digit sum for each product.<br>
Finally I assign each digit a color from a gradient that corresponds
to its relative value, and print the matrix of color-coded digit sums.<br>

### Some observations to prove
- If the zenith digit (base - 1) is prime, the digit sum of the products
will never include the zenith, unless it is in the zenith row and column,
in which case it will always be the zenith.
- (Say something about the (n - 1) pattern, divisibility & repetition)
- The matrix will always have two axes of symmetry because of this:
Diagonally from (1, 1) to (zenith, zenith), and
diagonally from (1, zenith - 1) to (zenith - 1, 1).
- This means that at most only a quarter of the grid needs to be searched
for the existence of the Z-digit.
- (Say how rows can be excluded/ruled-out/inferred based on (n - 1) rule)
