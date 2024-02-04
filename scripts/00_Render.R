#k = 100

#r = 0.6

#m = 0.2

#d = 0.8

b = seq(0, 100)

growth <- r_a * b  * (1 - b / k_a)

stays <- growth * D_ba

plot(b, growth)

b <- rep(1,100) 

for (y in 2:100) {
  
  growth = r_a * b[y-1]  * (1 - b[y-1] / k_a)
  
  stays_local = (D_aa) * growth
  
  b[y] = (M_aa) * b[y-1] + stays_local
  
}

plot(b)

## Building Out the Example More
# So, if the net export rate is >= r, we know the population will go extinct
# Export rate from Patch A is defined as M_ab (adult movement A -> B) and D_ab (larval movement A -> B)
# If export rate >= 0.6 will go to zero
# If export rate <= 0.6 population is sustained.

# Create a sequence of 100 x_a values from 0.1 to 100
x_a_values <- seq(0.1, 100, length.out = 100)

# Calculate growth using the formula
growth_values <- r_a * x_a_values * (1 - x_a_values / k_a)
export_values <- (M_ab * x_a_values) + (D_ab * (r_a * x_a_values  * (1 - x_a_values / k_a)))

export_value_ratio <- export_values/growth_values

# Create a dataframe
data <- data.frame(x_a = x_a_values, growth = growth_values, export_values = export_values, export_value_ratio = export_value_ratio)

ggplot() +
  geom_line(data=data, aes(x = x_a, y = growth_values)) +
  geom_line(data=data, aes(x = x_a, y = export_values), color = "red") 

#results_plot2 <- as.data.frame(results_matrix_soa) 

#ggplot() +
#  geom_line(data=results_plot2, aes(x = timestep, y = x_a, color = factor(x_a_init)))



