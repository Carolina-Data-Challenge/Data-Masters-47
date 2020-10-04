#Looking at whether internet usage correlated with GDP change during recession
GDP <- read.csv('gdp.csv')
vizdata <- read.csv('vizdata.csv')

ChangePC <- GDP %>%
  filter(Units == 'Purchasing power parity; percent change')

Internet <- vizdata %>%
  filter(measure=='Internet') %>%
  arrange(X2010)

#How many do we need
Filter = 186*0.2
#Taking top 37/bottom 37
Bottom37 <- Internet$ISO[6:42]
Top37 <- Internet$ISO[155:191]

Bottom37GDP <- ChangePC %>%
  filter(ISO %in% Bottom37,)

Top37GDP <- ChangePC %>%
  filter(ISO %in% Top37,)

Test <- Bottom37GDP
Top37Test <- Top37GDP

i <- 20
while (i <= 50) {
  Test[i] <- as.numeric(as.character(unlist(Test[[i]])))
  i = i+1
}

i <- 20
while (i <= 50) {
  Top37Test[i] <- as.numeric(as.character(unlist(Top37Test[[i]])))
  i = i+1
}

#Writing to CSV to play around with in Excel/Tableau
write.csv(Test, 'Bot37.csv')
write.csv(Top37Test, 'Top37.csv')