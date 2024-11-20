# Title: "Association Rules - Market Basket Analysis"

# Introduction:
# The aim of the project is to perform an association rules technique called the Apriori algorithm 
# to see buying tendencies of customers. The project uses association rules determinants such as:
# - Support: How many times a product appears in the dataset.
# - Lift: Determines the relationship between products (above 1 indicates positive correlation).
# - Confidence: Represents the probability of occurrence.

library(arules)
library(arulesViz)
library(arulesCBA)

# Set working directory and load dataset
Gro <- read.transactions("groceries.csv", format = "basket", sep = ",")

# 1. Data Preparation
# Summary of the dataset
summary(Gro)

# Total number of products
print(sum(size(Gro)))

# Statistics about the dataset
itemFrequency(Gro, type = "absolute")
itemFrequency(Gro, type = "relative")

# Plot item frequencies
itemFrequencyPlot(Gro, topN = 15, type = "relative")
itemFrequencyPlot(Gro, topN = 15, type = "absolute")

# 2. Apriori Algorithm
# Set support to 1% and confidence to 50%
groceryrules <- apriori(Gro, parameter = list(support = 0.01, confidence = 0.5, minlen = 2))

# Inspect rules
inspect(groceryrules[1:15])

# Reorder rules by confidence, lift, and support
sorted_rules1 <- sort(groceryrules, by = "confidence")
inspect(sorted_rules1[1:15])

sorted_rules2 <- sort(groceryrules, by = "lift")
inspect(sorted_rules2[1:15])

sorted_rules3 <- sort(groceryrules, by = "support")
inspect(sorted_rules3[1:15])

# 3. Graphs
# Grouped matrix graph
plot(groceryrules, method = "grouped")

# Graph plot
plot(groceryrules, method = "graph")

# Parallel coordinates plot
plot(groceryrules, method = "paracoord", control = list(reorder = TRUE))

# 4. Conclusions
# The Apriori algorithm is a great tool for learning tendencies from a dataset. 
# In this project, the Apriori algorithm with a support of 1% and confidence of 50% was used 
# on a dataset of market basket transactions. Results showed that whole milk and other 
# vegetables were the most frequently associated products.

# 5. Sources
# https://towardsdatascience.com/association-rules-2-aa9a77241654
# https://towardsdatascience.com/apriori-association-rule-mining-explanation-and-python-implementation-290b42afdfc6
