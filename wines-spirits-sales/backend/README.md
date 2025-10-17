# Backend for Wines & Spirits Sales Tracker

This directory contains all the backend code for the Wines & Spirits Sales Tracker project.

## Components

- **`/api`**: Contains the FastAPI application, including API endpoints, database models, and configuration.
- **`/notebooks`**: Contains Google Colab notebooks used for development, testing, and utility tasks like database setup.
- **`/tests`**: Contains test cases for the backend API.

## Getting Started: Database Setup

The primary way to set up and seed your NeonDB database is by using the provided Google Colab notebook.

### Using the Colab Notebook

1.  **Open the Notebook**: Navigate to `backend/notebooks/` and open `database_setup.ipynb` in Google Colab.
2.  **Follow the Instructions**: The notebook provides step-by-step instructions to:
    - Mount your Google Drive.
    - Install necessary dependencies.
    - Connect to your NeonDB instance.
    - Create the database schema by running `database/schema.sql`.
    - Populate the database with sample data by running `database/seed_data.sql`.

This is the recommended approach for a quick and reliable setup.

## Running the API

Once the database is set up, you can run the FastAPI application.

1.  **Install Dependencies**:
    ```bash
    pip install -r api/requirements.txt
    ```
2.  **Run the Server**:
    ```bash
    uvicorn app:app --reload --app-dir wines-spirits-sales/backend/api
    ```

The API will be available at `http://127.0.0.1:8000`.