Flora.sql is an SQLite script that loads a sample dataset and partially translates it into Darwin Core form.

The date column is translated into ISO 8601 format for standardisation. The century was removed by SQLite. Python also removed it.
The century had to be restored using a year toggle, documented in flora.sql.

This is a repeatable script using a standard, open source product in SQLite.

flora_reformatted.csv is the output dataset.

The below query returned no rows, showing that KEY is the primary key. (The asterisk doesn't display).

select key, count('*) from flora group by key having count('*) > 1;
