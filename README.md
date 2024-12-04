# CS 470 - PostgreSQL Implemenation

name: Joshua Castro

email: ject4b@umsystem.edu

Included are the same database implementaions just as different files. One is a SQL file. One is a dump file.


SQL FILE RESTORATION:

  psql -U postgres -d ContactManagerDB -contactmanagerdb.sql


DUMP FILE RESTORATION:

  pg_restore -U postgres -d ContactManagerDB -businesscontactdb.dump

