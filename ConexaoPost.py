import psycopg2 as p
con = p.connect(user="postgres",
                                  password="root",
                                  host="127.0.0.1",
                                  database="teste")
cur = con.cursor()
