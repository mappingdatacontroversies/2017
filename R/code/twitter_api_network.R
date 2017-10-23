setwd("~/Documents/GitHub/dat_prot_sciencespo/R/code")
# General Information -------------------------------------------------------------

#Author: Vlagyiszlav Makszimov
#Date: Wednesday 18 October 2017
#Subject: Twitter Network of Actors

# Packages ----------------------------------------------------------------
library(twitteR)
library(rtweet)
library(stringr)
library(stringi)
# Twitter API keys --------------------------------------------------------

consumer_key <- "HlD2iZZQkuAJ2f9BoJhBCA3mO"
consumer_secret <- "ZK6RaAvhQVte1J1RBj55BDzvdz6aeaA6PpLf0cWdWPm7a9E2lU"
access_token <- "2416344931-PS4bFHo5esnk3G3SH0OyRCOxgy5gpn8PQY58XJY"
access_secret <- "T6nLdFXeqRT3EAHzhH0YDmY9IVg6MVOIROUhaPCjp4a8z"
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
create_token(app = "datapRotection", consumer_key, consumer_secret,
             cache = F)
datapRotection
# Import list of actors --------------------------------------------------------------------
actors <- read.table("../data/actors.csv", sep=";", header=T,stringsAsFactors=F)


users <- actors$Twitter
userrelations <- list() #Create an empty list to populate

for (i in 52:length(users)){
  fr <- get_friends(users[i])
  friends <- lookup_users(fr, parse = T,tw=F,clean_tweets = F)
    friends$user <- users[i]
    userrelations[[i]] <- friends
}
user_el <- do.call("rbind",userrelations)


#edges <- data.frame(Source=user_el$user, Target=user_el$screen_name)
#edges$Source <- lapply((strsplit(as.character(edges$Source), "@")),'[',2)
#edges$Source <- (unlist(edges$Source))




# Creating additional data representing the original actors ---------------
users[users==""] <- NA
actors <- na.omit(users)
actors <- lapply((strsplit(as.character(users), "@")),'[',2)
actors <- as.character(actors)
actors <- lookup_users(actors, parse = T,tw=F,clean_tweets = F)
actors$user <- as.character(na.omit(unlist(lapply((strsplit(as.character(users), "@")),'[',2))))
user_el <- rbind(actors,user_el)

# Appending Source and Target columns for Gephi processing ----------------
user_el$Target <- user_el$screen_name
user_el$Source <- unlist(lapply((strsplit(as.character(user_el$user), "@")),'[',2))
user_el$Id <- user_el$screen_name



#write.csv(user_el, "nodes.csv", row.names = T)
#write.csv(as.data.frame(edges), "edges.csv", row.names = F)
 
