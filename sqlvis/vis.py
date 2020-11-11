from IPython.display import display, Javascript, HTML
import json
import os 
import pandas as pd
import time
dir_path = os.path.dirname(os.path.realpath(__file__))
print(dir_path)



def schema_from_conn(conn):
    schema = {}
    tableQuery= """SELECT name FROM sqlite_master WHERE type ='table' AND name NOT LIKE 'sqlite_%';"""
    tables = pd.read_sql_query(tableQuery, conn)['name']

    for i in tables:
        headerQuery = "select * from "+i+" where 1=2"
        headers = list(pd.read_sql_query(headerQuery, conn))
        schema[i] = headers

    return schema

def visualize(s, schema):
    display(Javascript("""
        require.config({
            paths: {
                d3: 'https://d3js.org/d3.v5.min'
            }
        });
    """))

    display(HTML(filename= dir_path + '/styles.css.html'))
    display(Javascript(filename= dir_path + '/visualize.js'))

    #First, escape all quotation marks.
    q = s.replace('"', '\"')
    query = q.replace('\n', '')
    
    shortSchema = json.dumps(schema)

    return Javascript("""
        (function(element) {
            var query = '"""+query+ """';
            var schema = """+shortSchema+""";

            require(['viz'], function(viz) {
                viz(element.get(0), query, schema)
            });
        })(element);
    """)