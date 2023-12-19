library(tidyverse)

shopping <-
  read.csv("/home/kasian/workspace/projects/R/project/data/shopping_trends_updated.csv")

by_gender <- shopping |>
  ggplot(aes(x = Gender, y = Amount, fill = Gender)) +
  geom_bar(stat = "summary", fun = "mean", width = 0.5) +
  scale_fill_manual("legend", values = c("Male" = "#3a5069", "Female" = "pink"))

by_age <- shopping |>
  ggplot(aes(x = Age, y = Amount)) +
  geom_line(stat = "summary", fun = "mean", color = "#0033ff")

by_gender_and_size <- shopping |>
  ggplot(aes(x = Gender, y = Size, fill = Size)) +
  geom_bar(position = "stack", stat = "summary", fun = "sum", width = 0.5) +
  scale_fill_manual("legend", values = c("S" = "pink", "M" = "#eec26f", "L" = "#8bd98a", "XL" = "#c35b5b"))

by_fr_purchase <- shopping |>
  ggplot(aes(x = Gender, y = Purchases, fill = Purchases)) +
  geom_bar(position = "dodge", stat = "summary", fun = "sum", width = 0.3) +
  scale_fill_manual("legend", values = c("Weekly" = "pink", "Monthly" = "#eec26f", "Annually" = "#8bd98a", "Fortnightly" = "#c35b5b", "Quarterly" = "#e07ef4", "Bi-Weekly" = "#85effd", "Every 3 Months" = "#a99149"))

by_gender_and_category <- shopping |>
  ggplot(aes(x = Gender, y = Category, fill = Category)) +
  geom_bar(position = "dodge", stat = "summary", fun = "sum", width = 0.7) +
  scale_fill_manual("legend", values = c("Accessories" = "purple", "Clothing" = "black", "Footwear" = "darkgreen", "Outerwear" = "darkblue"))

by_gender_and_item <- shopping |>
  ggplot(aes(x = Gender, y = Item, fill = Item)) +
  geom_bar(position = "dodge", stat = "summary", fun = "sum", width = 0.6) +
  scale_fill_manual("legend", values = c("Dress" = "#007261", "Shoes" = "#90bd42", "Sweater" = "#deff64", "Scarf" = "#ff9100", "Pants" = "#467a8e", "Sunglasses" = "darkgreen","Sneakers" = "#e8f67d", "Gloves" = "#a0b3d4", "Coat" = "purple", "Jacket" = "black", "Hoodie" = "#ff0000", "Belt" = "#ffee00", "Jeans" = "#0088ff", "Sandals" = "#68f6d9", "Jewelry" = "pink", "Socks" = "#eec26f", "Shirt" = "#8bd98a", "T-shirt" = "darkgrey", "Handbag" = "#c35b5b", "Blouse" = "#e07ef4", "Backpack" = "#85effd", "Hat" = "#a99149", "Skirt" = "#5768bd", "Shorts" = "#7d1a1a", "Boots" = "#7c663d"))

shopping |>
  count(Purchases)

ggsave("plot1.png", plot = by_gender)
ggsave("plot2.png", plot = by_age)
ggsave("plot3.png", plot = by_gender_and_size)
ggsave("plot4.png", plot = by_fr_purchase)
ggsave("plot5.png", plot = by_gender_and_category)
ggsave("plot6.png", plot = by_gender_and_item)
