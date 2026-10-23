births = read.csv("Desktop/statystyka/lab2/births.csv")
hist(births$BirthWeightGm)
boxplot(births$BirthWeightGm)

plot(births$BirthWeightGm, births$MomAge)

boxplot(BirthWeightGm ~ MomRace, data=births)

Fhat <- ecdf(births$BirthWeightGm) # empirical cumulative density function = ecdf
Fhat(3000)
plot(Fhat)

# Zadanie 1
h3units = read.csv("Desktop/statystyka/lab2/h3units.csv")
colnames(h3units)
good_castles = c("Castle", "Rampart", "Tower")
is_good <- (h3units$Castle %in% good_castles)
hist(h3units[is_good, ]$Health)
good_castles_ecfd <- ecdf(h3units[is_good, ]$Health)
plot(good_castles_ecfd)

boxplot(Maximum.Damage ~ Castle, data=h3units)

numbers = c(1: 10)
for (num in numbers) {
  print(num)
}

collatz <- function(n) {
  seq <- c(n)
  while (n > 1) {
    if (n%%2 == 0) {
      n <- n/2
    } else {
      n <- 3 * n + 1
    }
    seq <- c(seq, n)
  }
  return(seq);
}

collatz(10)

# Zadanie 2

X = c(1:10)
X
X <- sapply(X, function(x) x * x)
X

num = c(1:10000)
num <- sapply(num, function(x) length(collatz(x)))
plot(num)

install.packages("dplyr")
library(dplyr)

mtcars

mtcars %>% filter(hp>100) %>% arrange(desc(mpg)) %>% head()
births %>% group_by(RaceMom) %>% summarize(avg=mean(BirthWeightGm))
births %>% mutate(massKg = BirthWeightGm/1000)

births %>% filter(BirthWeightGm > 3000) %>% select(c("Weeks", "RaceMom")) %>% distinct()

install.packages("ggplot2")
library(ggplot2)

ggplot(births, aes(x=Weeks, y=BirthWeightGm)) + geom_point(size=.5, aes(col=as.factor(Smoke))) + theme_minimal() + xlab("Tydzień")

birth_plot <- ggplot(births) + theme_minimal()
birth_plot
birth_plot + aes(group=RaceMom, x=RaceMom, y=BirthWeightGm) + geom_violin()
birth_plot + aes(x=RaceMom) + geom_bar() + geom_violin(aes(group=RaceMom,y=BirthWeightGm))
birth_plot + aes(x=Weeks, y=BirthWeightGm) + geom_point(size=.5) + geom_smooth(method="lm") + facet_grid(vars(HispMom), vars(Smoke))

# Zadanie 4
X <- rnorm(2000, mean=4, sd=2)
X <- data.frame(X)
ggplot(X, aes(X)) + geom_histogram(aes(y=..density..), binwidth = 0.3)

x <- seq(-5, 15, 0.2)
y <- dnorm(x, mean=4, sd=2)
d <- data.frame(x, y)
ggplot(X, aes(X)) + geom_histogram(aes(y=..density..), binwidth = 0.3) + geom_line(aes(x=x, y=y), data=d)

