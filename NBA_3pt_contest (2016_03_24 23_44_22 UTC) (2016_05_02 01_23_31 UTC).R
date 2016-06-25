Belinelli <- read.csv("Belinelli.txt")
Curry <- read.csv("Curry.txt")
Harden <- read.csv("Harden.txt")
Irving <- read.csv("Irving.txt")
Korver <-  read.csv("Korver.txt")
Matthews <-  read.csv("Matthews.txt")
Redick <-  read.csv("Redick.txt")
Thompson <-  read.csv("Thompson.txt")

current_season <- rbind(Belinelli[8,], Curry[6,], Harden[6,], Irving[4,], 
                        Korver[14,], Matthews[6,], Redick[11,], Thompson[4,])

career <- rbind(Belinelli[9,], Curry[7,], Harden[7,], Irving[5,], 
                                  Korver[15,], Matthews[7,], Redick[12,], Thompson[5,])
row.names(current_season) <- c("Belinelli", "Curry", "Harden", "Irving", 
                               "Korver", "Matthews", "Redick", "Thompson")

career <- cbind(career, Player_Name = row.names(x = current_season))

current_season <- cbind(current_season, Player_Name = row.names(x = current_season))
attach(current_season)
threeptshare <- (X3P*3)/PTS
current_season <- cbind(current_season, threeptshare)

## 3 pt. efficiency

p1 <- ggplot(current_season, aes(x = X3P., y = reorder(Player_Name, X3P.))) + 
        geom_point(shape = 21, size = 5, fill = "orange") + xlab("3 pt. %") + 
        ylab("Player") + geom_text(label = round(X3P.,2), vjust = -1)

## What share of points scored by these guys are from 3 pointers?

p2 <- ggplot(current_season, aes(x = threeptshare, y = reorder(Player_Name, threeptshare))) + 
        geom_point(shape = 21, size = 5, fill = "orange") + xlab("% pts from 3 pt.") + 
        ylab("") + geom_text(label = round(threeptshare, 2), vjust = -1)

p3 <- ggplot(current_season, aes(x = X3P/MP, y = reorder(Player_Name, X3P/MP))) + 
        geom_point(shape = 21, size = 5, fill = "orange") + xlab("3 pts. per minute") + 
        ylab("") + geom_text(label = X3P/MP, vjust = -1)

grid.arrange(p1, p2, p3, nrow = 1, main = "Some graphs lol")