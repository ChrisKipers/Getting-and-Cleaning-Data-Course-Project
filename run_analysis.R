source('data_source_handler.R')
source('data_cleaner.R')
source('statistics_logic.R')

raw.phone.sensor.data <- getRawData()

phone.sensor.data <- do.call(cleanData, raw.phone.sensor.data)

rm(raw.phone.sensor.data)

variable.summary <- getTotalSummary(phone.sensor.data)

averages.grouped.by.activity.and.result.type <-
  getAverageForVariableBySubjectAndActivity(phone.sensor.data)

