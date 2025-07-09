import sqlite3

conn = sqlite3.connect('book_store.db')
cursor = conn.cursor()

# Exemple de création de table theme
cursor.execute('''
CREATE TABLE IF NOT EXISTS theme (
    theme_id INTEGER PRIMARY KEY,
    theme_name TEXT NOT NULL
)
''')

# Ajoute ici la création des tables book et review adaptées à ton besoin
cursor.execute('''
CREATE TABLE IF NOT EXISTS book (
    book_id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    author_id INTEGER,
    theme_id INTEGER,
    FOREIGN KEY(author_id) REFERENCES author(author_id),
    FOREIGN KEY(theme_id) REFERENCES theme(theme_id)
)
''')

cursor.execute('''
CREATE TABLE IF NOT EXISTS review (
    review_id INTEGER PRIMARY KEY,
    book_id INTEGER,
    customer_id INTEGER,
    rating INTEGER,
    comment TEXT,
    FOREIGN KEY(book_id) REFERENCES book(book_id),
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
)
''')

conn.commit()
conn.close()

print("Tables créées dans book_store.db")
