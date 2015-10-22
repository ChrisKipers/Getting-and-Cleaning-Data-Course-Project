library(dplyr)

getTotalSummary <- function(phone.sensor.data) {
  range.to.get.data <- 1:561
  means <- sapply(phone.sensor.data[, range.to.get.data], mean)
  standard.deviations <- sapply(phone.sensor.data[, range.to.get.data], sd)
  value.names <- names(phone.sensor.data)[range.to.get.data]
  summarized.data <- cbind(value.names, means, standard.deviations)
  colnames(summarized.data) <- c('variable', 'mean', 'standard.deviation')
  rownames(summarized.data) <- range.to.get.data
  summarized.data
}

getAverageForVariableBySubjectAndActivity <- function(phone.sensor.data) {
  grouped.phone.sensor.data <- group_by(phone.sensor.data, activity, result.type)
  summarise_each(grouped, c(mean), -c(activity, activity.id, result.type))
}