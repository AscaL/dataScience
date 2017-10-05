install.packages("tidyverse")
library(tidyverse)
?mpg

#is it true that cars with big engine consume more fuel

ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy))
ggplot(mpg) + geom_point(mapping = aes(x = displ, y= hwy))

nrow(mpg) #rows
ncol(mpg) #col
ggplot(mpg) + geom_point(aes(hwy, cyl, color=class))
ggplot(mpg) + geom_point(mapping = aes(x = displ, y= hwy, shape=class))
ggplot(mpg) + geom_point(mapping = aes(x = displ, y= hwy, size = class))
ggplot(mpg) + geom_point(mapping = aes(x = displ, y= hwy, color = hwy))
ggplot(mpg) + geom_point(mapping = aes(x = displ, y= hwy, alpha = class))

ggplot(mpg) + geom_point(mapping = aes(x = displ, y= hwy)) + facet_wrap(~ class)
ggplot(mpg) + geom_point(mapping = aes(x = displ, y= hwy)) + facet_grid(drv ~ cyl)

# Linear regression
# hwy = a + b(displ) # b<0

ggplot(mpg) + geom_point(mapping = aes(x = displ, y= hwy))

lm(hwy ~ displ, data = mpg)

ggplot(mpg) + 
  geom_point(mapping = aes(x = displ, y= hwy)) + 
  geom_abline(intercept = 35.698, slope = -3.531, color="blue")

ggplot(mpg) + 
  geom_point(mapping = aes(x = displ, y= hwy, color = class)) + 
  geom_smooth(mapping = aes(x = displ, y= hwy), method = lm) 

ggplot(diamonds) +
  geom_bar(mapping = aes(x = cut))

ggplot(diamonds) +
  stat_summary(mapping = aes(x = cut, y = depth), fun.ymin = min, fun.ymax = max, fun.y = median)

ggplot(diamonds) +
  geom_bar(mapping = aes(x = cut, fill = cut)) 

ggplot(diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity)) 

ggplot(diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge") 

ggplot(mpg) +
  geom_count(aes(displ, hwy))

ggplot(mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() +
  geom_jitter()
