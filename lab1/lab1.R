# basic operations
exp(1)
sin(.3)
log(2)
?log
pi
x <- c(1,4,2,6,7,8.2)
help(seq)
x^2
x > 3
mean(x)
sum(x)
sum(x>3)
cumsum(x)
sd(x)
var(x)
sqrt(var(x))
x[3:5]
y <- x
y
y[3:5] <- pi^(1:3)
y
x
x[-1]

# sampling
runif(1)
runif(10, min=3, max=7)
rnorm(5, mean=3)
?rnorm
sample(x, 3)
sample(x, 10, replace=T)

# using dataframes
mtcars
?mtcars
dim(mtcars)
ncol(mtcars)
colnames(mtcars)
head(mtcars)
mtcars[c(1,3), c(2,4)]
mtcars[1:3, 2:4]
mtcars[mtcars["cyl"] > 4,]
summary(mtcars)
mtcars$vs <- as.factor(mtcars$vs)
summary(mtcars)

# Task 1
exp(pi * sqrt(43))
is.integer(exp(pi*sqrt(43)))
?is.integer
z <- exp(pi * sqrt(43))
z
round(z) == z

# Monte Carlo Pi
n <- 1000000
xs <- runif(n, min=-1, max=1)
ys <- runif(n, min=-1, max=1)
inside_circle <- (xs^2 + ys^2 <= 1)
4 * sum(inside_circle)/n 

# Task 3
ciag <- c(9, 15, 2, 18, 16, 4, 19, 17, 6, 13, 3, 12, 7, 5, 10)
min(ciag)
mean(ciag)
median(ciag)

# Task 4
?mtcars
max(mtcars["mpg"])
mtcars
mtcars[mtcars["mpg"] == max(mtcars["mpg"]), ]

?data.frame
mean(drats)

max(mtcars$mpg)
mtcars[which.max(mtcars$mpg),]
rownames(mtcars)[which.max(mtcars$mpg)]

max_mpg <- max(mtcars$mpg)
auto_max_mpg <- rownames(mtcars)[which.max(mtcars$mpg)]

cat("Maksymalny mpg:", max_mpg, "\nSamochód:", auto_max_mpg, "\n\n")

# Top 3 jeśli chodzi o ilosc koni mechanicznych
head(mtcars[order(mtcars$hp, decreasing=TRUE), ], n=3)

# przyspieszenia
mean(mtcars$qsec)

mean(subset(mtcars, mtcars$am==1)$qsec)
mean(subset(mtcars, mtcars$am==0)$qsec)

is_merc <- grepl("Merc", rownames(mtcars))
mean(mtcars$qsec[is_merc])

prog_80 <- quantile(mtcars$hp, 0.80)
mean(mtcars$qsec[mtcars$hp >= prog_80])

getwd()
heroes <- read.csv("Desktop/statystyka/h3units.csv")
?heroes
summary(heroes)

unique(heroes$Castle)
median(subset(heroes, heroes$Castle=="Necropolis")$Attack)
mean(subset(heroes, heroes$Castle=="Stronghold" & grepl("\\+", heroes$Level))$Defence)

latajace <- grepl("Flying", heroes$Special_abilities)
aggregate(Speed ~ Castle, data = subset(heroes, latajace), FUN = mean, na.rm = TRUE)
