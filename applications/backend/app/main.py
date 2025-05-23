from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "Hello from FastAPI"}

@app.get("/products")
def read_products():
    return {"products": ["Product A", "Product B"]}

@app.get("/home")
def read_home():
    return {"message": "Welcome Home"}
