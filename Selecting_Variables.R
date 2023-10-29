# Selecting Subsets of Predictors
wine <- read.csv("winequality.csv")

# Linear regression of quality with all predictors
lm <- lm(quality ~ ., data = wine)
options(scipen = 999)
summary(lm)

# Backward
lm.back <- step(lm, direction = "backward")
summary(lm.back)

# Forward
wine.lm.null <- lm(quality ~ 1, data = wine)
lm.forward <- step(wine.lm.null, scope = list(lower = wine.lm.null, upper = lm), direction = "forward")
summary(lm.forward)

# Both
lm.both <- step(lm, direction = "both")
summary(lm.both)

