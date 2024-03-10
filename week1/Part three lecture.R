lake.df = read.csv("Lake.csv")

ggplot(data = lake.df,
       mapping = aes(x = pH, y = Chlorophyll))

