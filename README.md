# SQLvis

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

## Visualization explanation
SQLvis draws graph representations of SQL queries. Below, I show some queries and visualization examples.

### Example 1


```sql
SELECT c.cName 
FROM customer AS c, purchase AS p 
WHERE p.cID = c.cID;
```
| Visualization&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| Explanation                                                  |
| ------------------------------------------------------------ | :----------------------------------------------------------- |
| <img src="https://github.com/Giraphne/SQLvis/raw/main/images/node_join_alias.png"> | This example shows the basic graph structure we use. Each table that is called within the query is represented as a node. The node also displays its alias, if it has one. Relations between tables, such as JOIN conditions, are shown as edges with the content of the condition on the edge. |

### Example 2

```sql
SELECT * 
FROM customer AS c 
WHERE city = "Amsterdam" OR city = "Utrecht";
```


| Visualization&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| Explanation                                                  |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| <img src="https://github.com/Giraphne/SQLvis/raw/main/images/selection_condition.png"> | Each node in the visualization can be expanded to show the schema of the table. Then, the schema is highlighted based on the contents of the query. Selection on columns is highlighted in orange. Here the query contains SELECT *, so all columns are highlighted. Conditions are highlighted in green. This query contains two conditions, both on the city attribute. |

### Example 3


```sql
SELECT c.cName 
FROM customer AS c 
WHERE EXISTS (SELECT pr.pID 
	FROM purchase AS p, product AS pr 
	WHERE p.cID = c.cID 
	AND p.pID = pr.pID 
	AND pr.pID < 10);
```
| Visualization&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Explanation                                                  |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| <img src="https://github.com/Giraphne/SQLvis/raw/main/images/subquery.png"> | This visualization displays a subquery. The two tables in the subquery are purchase and product. You can see that these are wrapped in a colored rectangle. The visualization can als represent nesting on higher levels. The deeper the nesting, the darker the color. |



This library is very alpha. If you find any issues or inconsistencies, please create an issue or message me.



## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
