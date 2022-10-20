rowSums(is.na(x))
sum(rowSums(is.na(x))>0)

sum(is.na(x))

head(x)
x[!complete.cases(x),]
y <- x[complete.cases(x),]
head(y)

st <- data.frame(state.x77)
boxplot(st$Income)
boxplot.stats(st$Income)$out

out.val <- boxplot.stats(st$Income)$out
st$Income[st$Income %in% out.val] <- NA
head(st)
newdata <- st[complete.cases(st),]
head(newdata)
