data.dir <- 'data'
common.path.to.files <- file.path(data.dir, 'UCI HAR Dataset')
path.to.activity.labels <- file.path(common.path.to.files, 'activity_labels.txt')
path.to.features <- file.path(common.path.to.files, 'features.txt')
path.to.x.test <- file.path(common.path.to.files, 'test', 'X_test.txt')
path.to.y.test <- file.path(common.path.to.files, 'test', 'y_test.txt')
path.to.x.train <- file.path(common.path.to.files, 'train', 'X_train.txt')
path.to.y.train <- file.path(common.path.to.files, 'train', 'y_train.txt')

dataExists <- function() {
  all.file.paths <- c(path.to.activity.labels,
                      path.to.features,
                      path.to.x.test,
                      path.to.y.test,
                      path.to.y.train,
                      path.to.x.train)
  all.files.exist <- file.exists(all.file.paths)
  all(all.files.exist)
}

loadData <- function() {
  data.url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
  temp.file.name <- tempfile()
  dir.create(data.dir)
  setwd(data.dir)
  download.file(data.url, temp.file.name, method = 'curl')
  unzip(temp.file.name)
  setwd('..')
}

removeData <- function() {
  unlink(data.dir, recursive = T)
}

getRawData <- function() {
  if (!dataExists()) {
    loadData()
  }
  
  list(
    activity.labels = read.table(path.to.activity.labels),
    features = read.table(path.to.features),
    x.test = read.table(path.to.x.test),
    y.test = read.table(path.to.y.test),
    x.train = read.table(path.to.x.train),
    y.train = read.table(path.to.y.train))
}