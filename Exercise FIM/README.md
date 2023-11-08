# PostgreSQL: FIM Database


## Create the database

Create the database **FIM** with your PostgreSQL program. It can be done using **pgAdmin 4**, **visual studio code** or the **psql console**.

## Create the ERM diagram and Relational Model

### ERM Diagram
![image](https://drive.google.com/uc?export=view&id=1zB5Z8MoWPBCvI-9irtNgnbKE8UqChvkS)

Once it's done, it's time to create the tables: entity tables and relationship tables. *Remember, with M:N relationships it's necessary to create a relationship table, with 1:N relationships the entity with the 'many' gets the id of the related entity as foreign key.*

### Relational Model
Tables:
>*Primary key standard is specified with underlined, in this file, the primary key will be specified with `(pk)`.*
