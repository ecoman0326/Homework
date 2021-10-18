##Homework1018tidyr.R##

library (tidyverse)

#Replace
data_raw<-read_delim("https://www.dipintothereef.com/uploads/3/7/3/5/37359245/rairuoho.txt",
                     delim = "\t")

data_raw$treatment[which(data_raw$treatment == "nutrient")] <- "enriched"

#By 1 liner for All
data_clean <- data_raw %>% pivot_longer(day3:day8, names_to = "day", values_to = "length") %>%
  mutate(day = as.factor(day)) %>%
  unite("spatial_coordinates", spatial1, spatial2, sep = "_") %>%
  select(-row, -column)

write.table(data_clean, "D:\\RforEco\\Ecological data analysis in R(OCEAN5098)\\CONTENTS\\Lesson2-Data manipulation\\data_clean.txt")  

  
