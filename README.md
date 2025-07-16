# 🛒 E-commerce Product API

A simple backend API to manage products for an e-commerce platform.

---

## 🧱 Tech Stack

- **Python**: 3.12.4
- **Django**: 4.2.23
- **Django REST Framework**: 3.14.0
- **Docker**: For containerized development and deployment

---

## 🚀 How to Run the Project

```bash
git clone -b develop https://github.com/seyawudba/hustlr-test-app
cd ecommerce_app
docker compose up
```

Access the development server at [http://0.0.0.0:8000](http://0.0.0.0:8000) in your browser.

---

## 📚 API Documentation

- **Postman Collection**: See `docs/E-COMMERCE APP.postman_collection.json` in this repo for full API documentation and sample requests.
- **Swagger/OpenAPI (Interactive Docs)**: [http://0.0.0.0:8000/api/docs/](http://0.0.0.0:8000/api/docs/)
- **OpenAPI Schema (Raw)**: [http://0.0.0.0:8000/api/schema/](http://0.0.0.0:8000/api/schema/)

---

## 🛠️ Endpoints

| Method | Endpoint                | Description                        | Query Params / Path Vars |
|--------|-------------------------|------------------------------------|-------------------------|
| GET    | `/store/products/`      | List all products                  |                         |
| GET    | `/store/products/{id}/` | Retrieve a product by ID           | `{id}`                  |
| GET    | `/store/products/`      | Filter products by category        | `?category=Apparel`     |
| POST   | `/store/products/`      | Create a new product (validated)   | (JSON body)             |

---

## 🧪 Sample Requests

**List all products**
```bash
curl http://0.0.0.0:8000/store/products/
```

**Get a product by ID**
```bash
curl http://0.0.0.0:8000/store/products/1/
```

**Filter by category**
```bash
curl "http://0.0.0.0:8000/store/products/?category=Apparel"
[{"id":6,"name":"Janos","description":"In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.","inventory":3035,"unit_price":"7259.42","collection":"Collection2","category":"Apparel"},{"id":7,"name":"Renell","description":"Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.\n\nMauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.","inventory":7366,"unit_price":"9818.83","collection":"Collection2","category":"Apparel"},{"id":9,"name":"Selia","description":"Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.","inventory":7534,"unit_price":"9289.10","collection":"Collection3","category":"Apparel"},{"id":11,"name":"test","description":"hustlr test","inventory":34,"unit_price":"16.34","collection":"Collection1","category":"Apparel"}]
```

**Create a new product**
```bash
curl -X POST http://0.0.0.0:8000/store/products/ \
-H "Content-Type: application/json" \
-d '{
  "name": "Sneakers",
  "description": "Running shoes",
  "inventory": 10,
  "unit_price": "59.99",
  "collection": "Spring",
  "category": "Footwear"
}'
{"id":19,"name":"Sneakers","description":"Running shoes","inventory":10,"unit_price":"59.99","collection":"Spring","category":"Footwear"}
```

---

## 📝 Notes

- The project uses Python, Django, and Docker for a robust, containerized backend API easy to run on any platform.
- To run locally, simply use `docker compose up` after cloning the repository and changing directory into the project folder.
- Full API documentation and sample requests are provided in the included Postman collection.
