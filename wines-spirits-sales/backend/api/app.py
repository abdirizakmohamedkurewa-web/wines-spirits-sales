from fastapi import FastAPI

app = FastAPI(
    title="Wines & Spirits Sales Tracker API",
    description="API for tracking sales, inventory, and profits for a liquor store.",
    version="0.1.0",
)

@app.get("/")
def read_root():
    """
    A simple root endpoint to confirm the API is running.
    """
    return {"message": "Welcome to the Wines & Spirits Sales Tracker API!"}

# In a real application, you would add more endpoints here, for example:
# from . import routes
# app.include_router(routes.products.router, prefix="/products", tags=["products"])
# app.include_router(routes.sales.router, prefix="/sales", tags=["sales"])