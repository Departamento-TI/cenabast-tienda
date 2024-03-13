from datetime import datetime

# Converts a cenabast date to an ISO8601 string date
# Assumes the timezone offset as -3 (Chile Summer Time)
def convert_date(date_str):
  # Assuming the input format is 'YYYYMM'
  year = int(date_str[:4])
  month = int(date_str[4:6])

  # Create a datetime object
  dt = datetime(year, month, 1, 0, 0, 0, 0)

  # Format the datetime object as ISO8601
  iso_date = dt.isoformat()

  # Append timezone offset
  iso_date_with_offset = iso_date + "-03:00"

  return iso_date_with_offset