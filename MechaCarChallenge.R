#Module 15 Challenge

# Deliverable 1

# add dply package
library(dplyr)

#import and read csv
table <- read.csv('MechaCar_mpg.csv', check.names = F, stringsAsFactors = F)

# run Shapiro tests on each dependent variable
shapiro.test(table$vehicle_length)
shapiro.test(table$vehicle_weight)
shapiro.test(table$spoiler_angle)
shapiro.test(table$ground_clearance)
# vehicle length not normal, all others normal

#determine relationship between vehicle weight and length
cor(table$vehicle_length,table$vehicle_weight)
# relation between length and weight is weak, unlikely to cause multicoliniarity

#transform  variables to log normal in new table
log_table <- table %>% transmute(log_vehicle_length = log(vehicle_length), 
                                 log_vehicle_weight = log(vehicle_weight),
                                 log_spoiler_angle = log(spoiler_angle),
                                 log_ground_clearance = log(ground_clearance),
                                 AWD=AWD,
                                 log_mpg = log(mpg))

#remove any inf or -inf values
log_table[is.na(log_table) | log_table=="-Inf"] = NA

#regress vehicle length, vehicle weight, spoiler angle, and awd on mpg
model <- lm(log_mpg ~ log_vehicle_length +log_vehicle_weight + log_spoiler_angle
            + log_ground_clearance + AWD, data=log_table)
summary(model)


# list of residuals
plot(model$residuals)
# breusch-pagan test 
bptest(model)
# no evidence of heteroskedasticity

# Deliverable 2

#import data from csv and save in table
susp_table <- read.csv('Suspension_Coil.csv')

#summarize data in new table
total_summary <- susp_table %>% summarize(Mean_PSI=mean(PSI), Median_PSI=median(PSI), 
                                           Variance_PSI=var(PSI), STDEV_PSI=sd(PSI))
#group by mfg lot and summarize
total_summary2 <- susp_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean_PSI=mean(PSI), Median_PSI=median(PSI), 
                                           Variance_PSI=var(PSI), STDEV_PSI=sd(PSI), .groups = 'keep')

# deliverable 3
?t.test()
# whole population
t.test((susp_table$PSI),mu=1500)
# by manufacturing lot
?subset()
t.test(subset(susp_table, Manufacturing_Lot == "Lot1")$PSI, mu=1500)
t.test(subset(susp_table, Manufacturing_Lot == "Lot2")$PSI, mu=1500)
t.test(subset(susp_table, Manufacturing_Lot == "Lot3")$PSI, mu=1500)











