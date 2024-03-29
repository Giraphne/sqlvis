# SQLvis

A library to generate a *graph-based* visualization of SQL queries in **Jupyter Notebooks**. More information on Jupyter Notebooks is [here](https://jupyter.org).

This library works best in **Chrome**. Please note that this is a research prototype, and therefore may be incomplete. If you find any issues or would like any extensions, feel free to post them under the Issues tab.

If you use SQLvis in your research, please cite this paper:

```
@inproceedings{SQLVis,
  author = {Miedema, Daphne and Fletcher, George},
  title = {{SQLVis}: Visual Query Representations for Supporting SQL Learners},
  booktitle = {2021 IEEE Symposium on Visual Languages and Human-Centric Computing (VL/HCC)},
  publisher = {IEEE},
  year = {2021}
}
```

## Installation

The easiest way is to install via pip:

```
$ pip install sqlvis
```



## Dependencies

* [Pandas](https://github.com/pandas-dev/pandas) 
  * ```$ pip install pandas```



## Usage

For the minimum working example below, please make sure to download shopping.db from the data folder. 

```python
from sqlvis import vis
import sqlite3

conn = sqlite3.connect('shopping.db')
```

```python
# Retrieve the shema from the db connection
schema = vis.schema_from_conn(conn)

```
```python
query = '''
SELECT cName FROM customer;
'''

# Generate the visualization.
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
| Visualization | Explanation       |
| ------------------------------------------------------------ | :----------------------------------------------------------- |
| <img src="https://github.com/Giraphne/SQLvis/raw/main/images/node_join_alias.png"  width="200"> | This example shows the basic graph structure we use. Each table that is called within the query is represented as a node. The node also displays its alias, if it has one. Relations between tables, such as JOIN conditions, are shown as edges with the content of the condition on the edge. |

### Example 2

```sql
SELECT * 
FROM customer AS c 
WHERE city = "Amsterdam" OR city = "Utrecht";
```


| Visualization | Explanation                                         |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| <img src="https://github.com/Giraphne/SQLvis/raw/main/images/selection_condition.png"  width="1000px"> | Each node in the visualization can be expanded to show the schema of the table. The expanded schema is highlighted based on the contents of the query. Selection on columns is highlighted in orange. Here the query contains SELECT *, so all columns are highlighted. Conditions are highlighted in green. This query contains two conditions, both on the city attribute. |

### Example 3


```sql
SELECT c.cName 
FROM customer AS c 
WHERE EXISTS (
    SELECT pr.pID 
    FROM purchase AS p, product AS pr 
    WHERE p.cID = c.cID 
    AND p.pID = pr.pID 
    AND pr.pID < 10);
```
| Visualization | Explanation                              |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| <img src="https://github.com/Giraphne/SQLvis/raw/main/images/subquery.png"  width="1200px"> | This visualization displays a subquery. The two tables in the subquery are purchase and product. You can see that these are wrapped in a colored rectangle. The visualization can als represent nesting on higher levels. The deeper the nesting, the darker the color. |

### SQLVis+
SQLVis+ is an extension to the original SQLVis implementation which handles select syntax errors. In case of referencing syntax errors such as incorrect references to database objects (tables or columns) the extension will produce error visualizations. These error visualizations contain enhanced error messages designed to guide the user to the root of the problem.

| Visualization | Explanation                              |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| <img src="https://github.com/Giraphne/SQLvis/raw/main/images/sqlvis_plus_error.png"  width="1200px"> | Our error highlighting for scoping and referencing errors includes the error where you forget to include the name of the Common Table Expression in the main query. The query is repaired in the background to be able to generate the link, and the link is shown in red. |
| <img src="https://github.com/Giraphne/SQLvis/raw/main/images/sqlvis_plus_hover.png"  width="1200px"> | When hovering over an erroneous, highlighted, link, an error message is shown. These are newly designed and should provide a hint on how to repair the query. |

Errors captured by SQLVis+ in the scoping and referencing category per keyword:
| SQL Keyword | Type of error captured |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
|   ALL/ANY/ EXISTS/IN          |  Scoping errors in the related subqueries |
|   AS                      |  Incorrect references to attributes, tables, subqueries by their alias |
|   AND/OR/BETWEEN/NOT/ LIKE |  Scoping errors in complex, nested WHERE statements |
|   FROM                  |  Scoping errors in the subqueries |
|   SELECT                |  Incorrect references in the SELECT clause |
|   WHERE                 |  Incorrect references in the WHERE clause |
|   WITH                  |  Incorrect references to the WITH clause. Incorrect usage of the temporary relation defined in the WITH clause |
|   JOIN (LEFT, RIGHT, OUTER, INNER) | Incorrect references inside the JOIN subqueries |
|   COUNT/SUM/MIN/MAX/ AVG | References to database objects on which aggregate function were applied |
|   GROUP BY | Incorrect references in the clauses related to the usage of aggregate functions |


## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
