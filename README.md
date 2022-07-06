Flora.sql is an SQLite script that loads a sample dataset and partially translates it into Darwin Core form.

The date column is translated into ISO 8601 format for standardisation. The century was removed by SQLite. Python also removed it.
The century had to be restored using a year toggle, documented in flora.sql.

This is a repeatable script using a standard, open source product in SQLite.
