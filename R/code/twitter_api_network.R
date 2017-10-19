
# General Information -------------------------------------------------------------

#Author: Vlagyiszlav Makszimov
#Date: Wednesday 18 October 2017
#Subject: Twitter Network of Actors

# Packages ----------------------------------------------------------------
library(twitteR)

# Twitter API keys --------------------------------------------------------

consumer_key <- "HlD2iZZQkuAJ2f9BoJhBCA3mO"
consumer_secret <- "ZK6RaAvhQVte1J1RBj55BDzvdz6aeaA6PpLf0cWdWPm7a9E2lU"
access_token <- "2416344931-PS4bFHo5esnk3G3SH0OyRCOxgy5gpn8PQY58XJY"
access_secret <- "T6nLdFXeqRT3EAHzhH0YDmY9IVg6MVOIROUhaPCjp4a8z"
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)


# Body --------------------------------------------------------------------


start <- getUser("@EUCourtPress")
friends_object <- lookupUsers(start$getFriendIDs())
friends_object