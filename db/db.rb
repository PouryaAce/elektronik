require 'pg'

def run_sql(sql, sql_params = [])
   db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'elektronik'})
    result = db.exec_params(sql, sql_params)
    db.close
    result
end