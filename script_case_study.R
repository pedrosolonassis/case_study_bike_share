
# Definição dos Bancos de Dados
trip25_Jan <- read.csv("202501-divvy-tripdata.csv")
trip25_Feb <- read.csv("202502-divvy-tripdata.csv")
trip25_Mar <- read.csv("202503-divvy-tripdata.csv")
trip25_Apr <- read.csv("202504-divvy-tripdata.csv")
trip25_May <- read.csv("202505-divvy-tripdata.csv")
trip25_Jun <- read.csv("202506-divvy-tripdata.csv")
trip25_Jul <- read.csv("202507-divvy-tripdata.csv")
trip25_Aug <- read.csv("202508-divvy-tripdata.csv")
trip25_Sep <- read.csv("202509-divvy-tripdata.csv")
trip25_Oct <- read.csv("202510-divvy-tripdata.csv")
trip25_Nov <- read.csv("202511-divvy-tripdata.csv")
trip25_Dec <- read.csv("202512-divvy-tripdata.csv")

# Juntar em uma única data
trips25_all<- rbind(trip25_Jan, trip25_Feb, trip25_Mar, trip25_Apr, trip25_May, trip25_Jun, trip25_Jul, trip25_Aug, trip25_Sep, trip25_Oct, trip25_Nov, trip25_Dec)

View(trips25_all)

#Tirar colunas irrelevantes
trips25_all <- trips25_all%>%  
  select(-c(start_lat, start_lng, end_lat, end_lng, start_station_id,end_station_id, end_station_name))

# Converter CSV para SQLite
library(RSQLite)
library(readr)

# 1. Criar (ou conectar) ao arquivo de banco de dados SQLite
con <- dbConnect(SQLite(), "trip25_database.db")

# 2. Gravar os dados na tabela 'trip25_all'
dbWriteTable(con, "trip25_all", dados, overwrite = TRUE)

# 3. Desconectar
dbDisconnect(con)