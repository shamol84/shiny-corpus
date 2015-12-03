library(twitteR)
library(tm)
library(wordcloud)
library(RColorBrewer)


# Using "memoise" to automatically cache the results
getTermMatrix <- function(y) {
  #setup_twitter_oauth("Fr3Pe5nED9dbjiGQWB1BlJRQJ", "b59ElZlRWeCN2gei2A4KYLOoDLPCDPk03jpqz3HMjPxzsISjHM", "209866257-Aqnjp4fI7ErOWa87IgPpZl6uZk55UNJHaIw3xmAT", "byrVnnMksCxI0sBm3A221gMqkZ3vSQt7Bw7YN28qfNjTN")
  z = toString(y)
  
  mach_tweets = searchTwitter(z, n=50, lang="en")
  mach_text = sapply(mach_tweets, function(x) x$getText())
  mach_text = sapply(mach_tweets, function(x) x$getText())
  # create a corpus
  mach_corpus = Corpus(VectorSource(mach_text))
  # create document term matrix applying some transformations
  tdm = TermDocumentMatrix(mach_corpus,
                           control = list(removePunctuation = TRUE,
                                          stopwords = c("machine", "learning", stopwords("english")),
                                          removeNumbers = TRUE, tolower = TRUE))
  
  # define tdm as matrix
  m = as.matrix(tdm)
  # get word counts in decreasing order
   sort(rowSums(m), decreasing=TRUE)
  # create a data frame with words and their frequencies
  #dm = data.frame(word=names(word_freqs), freq=word_freqs)
  #return (dm)
}