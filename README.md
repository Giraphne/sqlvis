#SQLvis

A library to generate a graph-based visualization of SQL queries in Jupyter.
This library works best in Chrome.

## Installation

The esiest way is to install via pip:

```
$ pip install sqlvis
```

## Example

For the minimum working example below, please make sure to download shoppingDB.sql from the data folder. 

```python
from SQLvis import vis
import sqlite3

# This creates/connects to a database instance on your local machine.
conn = sqlite3.connect('shopping.db')
cur = conn.cursor()
```
```python
# This cell populates the database.
# You can only populate each database once, so comment this cell out once it is finished.

# Replace this line with the correct location of the SQL file.
db_location = 'shoppingDB.sql'

f = open(db_location,'r')
sql = f.read()
cur.executescript(sql)

```
```python
# Retrieve the shema from the db connection
schema = vis.schema_from_conn(conn)

```
```python
query = '''
select cName from customer;
'''

vis.visualize(query, schema)
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.