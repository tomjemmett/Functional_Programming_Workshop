# Exercise 14

# here's a quick look at reduce, accumulate and flatten. these functions aren't
# as useful (in my opinion/experience!) as the map functions, but they do have
# their uses.
values <- 1:10

# try using reduce with any binary function, for example `+`, or min
# (note the backticks with the special infix functions +, -, *, /)
# try replacing reduce with accumulate to see the results

reduce(values, `+`)
accumulate(values, `+`)

# now, let's have a look at flatten. first, let's generate a list of random
# values
set.seed(134)
values <- map(values, ~sample(1:10, .x))

values

# now, try to flatten this to a single vector of doubles

flatten(values)
flatten_dbl(values)

# see what happens with the flatten function vs flatten_dbl