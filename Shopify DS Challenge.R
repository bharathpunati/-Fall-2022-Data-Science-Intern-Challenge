library(ggplot2)
library(ggvis)
library("RColorBrewer")
library(DT)
library(dplyr)
library(tidyr)
library(reshape2)
library(formattable)

data = read.csv('/Users/bharathpunati/Downloads/2019 Winter Data Science Intern Challenge Data Set - Sheet1.csv', header = TRUE)

summary(data)

## Order_amount has a max value of 704000 and median of 284. There are certainly outliers in our data and digging more 

aov_per_shop <- data %>%
  group_by(shop_id) %>%
  summarize(aov_per_shop = mean(order_amount)) %>%
  arrange(desc(aov_per_shop))


head(aov_per_shop, 10)



ggplot(shop_aov) +
  aes(x = "", y = shop_aov$aov_per_shop) +
  geom_boxplot() +
  coord_trans(y = "log10") +
  scale_y_continuous(breaks=c(50, 100, 150, 200, 350, 500, 20000)) +
  ylab("Average Order Value by shop") +
  xlab("")+
  theme_bw()


# Question 3
## Median as a metric
round(median(data$order_amount),2)
