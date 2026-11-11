"""Initialize MySQL driver, falling back to PyMySQL when mysqlclient is unavailable."""

try:
    import MySQLdb  # noqa: F401
except ImportError:
    import pymysql

    pymysql.install_as_MySQLdb()
