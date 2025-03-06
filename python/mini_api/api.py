from flask import Flask, make_response, jsonify, request
from content import books
import dataset

app = Flask(__name__)
db = dataset.connect('sqlite:///books.db')

@app.route('/')
def helloWorld():
  return 'Hello World'

@app.route('/api/books', methods=['GET', 'PUT', 'POST'])
def api_books():
  if request.method == 'GET':
    return make_response(jsonify(books), 200)
  elif request.method == 'PUT':
    content = request.json
    book_id = content['id']
    books[book_id] = content
    book_obj = books.get(book_id, {})
    return make_response(jsonify(book_obj), 201)
  elif request.method == 'POST':
    content = request.json
    books[content['id']] = content
    return make_response(jsonify(books), 200)


@app.route('/api/books/<id>', methods=['GET', 'PUT', 'DELETE'])
def api_book(id):
  if request.method == 'GET':
    return make_response(jsonify(books.get(id, {})), 200)
  elif request.method == 'PUT':
    content = request.json
    books[id] = content
    book_obj = books.get(id, {})
    return make_response(jsonify(book_obj), 201)
  elif request.method == 'DELETE':
    books.pop(id)
    return make_response(jsonify(books), 200)



if __name__ == '__main__': 
  app.run(debug=False, port=5000)