library(plyr)

cleanData <- function(x.train, y.train, x.test, y.test, activity.labels, features) {
  clean.feature.names <- sanitizeFeatureNames(features)
  training.data <- mergeXandYData(
    x.train,
    y.train,
    activity.labels,
    clean.feature.names)
  
  testing.data <- mergeXandYData(
    x.test,
    y.test,
    activity.labels,
    clean.feature.names)
  
  mergeTrainingAndTestingData(training.data, testing.data)
}

mergeXandYData <- function(x.table, y.table, activity.labels, features) {
  colnames(x.table) <- features
  colnames(y.table) <- c('activity.id')
  colnames(activity.labels) <- c('activity.id', 'activity')
  x.merged.with.y <- cbind(x.table, y.table)
  x.merged.with.activities = join(
    x.merged.with.y,
    activity.labels,
    by = 'activity.id')
}

mergeTrainingAndTestingData <- function(training.data, testing.data) {
  training.data.with.type <- cbind(training.data, result.type = 'training')
  testing.data.with.time <- cbind(testing.data, result.type = 'testing')
  rbind(training.data.with.type, testing.data.with.time)
}

sanitizeFeatureNames <- function(features) {
  features.without.double.paren <- gsub('\\(\\)', '', features$V2)
  features.without.open.paren.or.comma <- gsub('(\\(|,)', '-', features.without.double.paren)
  features.without.closing.paren <- gsub('\\)', '', features.without.open.paren.or.comma)
  make.names(features.without.closing.paren, unique = T)
}