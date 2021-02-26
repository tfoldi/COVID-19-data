CREATE TABLE IF NOT EXISTS WHO_TIMESERIES (
  COUNTRY_REGION VARCHAR,
  CASES_TOTAL int,
  CASES_TOTAL_PER_100000 float,
  CASES int,
  DEATHS_TOTAL int,
  DEATHS_TOTAL_PER_100000 float,
  DEATHS int,
  TRANSMISSION_CLASSIFICATION varchar,
  ISO3166_1 VARCHAR(2),
  DATE timestamp_ntz
);

INSERT INTO WHO_TIMESERIES (
  COUNTRY_REGION, 
  CASES_TOTAL, 
  CASES_TOTAL_PER_100000,
  CASES,
  DEATHS_TOTAL,
  DEATHS_TOTAL_PER_100000,
  DEATHS,
  TRANSMISSION_CLASSIFICATION,
  ISO3166_1,
  DATE
) 
SELECT COUNTRY_REGION, 
  CASES_TOTAL, 
  CASES_TOTAL_PER_100000,
  CASES,
  DEATHS_TOTAL,
  DEATHS_TOTAL_PER_100000,
  DEATHS,
  TRANSMISSION_CLASSIFICATION,
  ISO3166_1,
  DATE 
  FROM WHO_DAILY_REPORT
  WHERE WHO_DAILY_REPORT.DATE NOT IN (
    SELECT MAX(DATE) FROM WHO_TIMESERIES.DATE
  )
;