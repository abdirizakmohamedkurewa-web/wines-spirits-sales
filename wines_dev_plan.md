# Wines & Spirits Sales Tracker: Development Plan

## 1. Project Overview
This document outlines the end-to-end development plan for the **Wines & Spirits Sales Tracker**. The goal is to build a full-stack system to help liquor store owners track sales, monitor inventory, and analyze profits. This plan provides a structured roadmap for developers and project managers, from initial setup to final deployment.

## 2. Target Audience
*   **Project Managers:** To track milestones, phases, and overall project progress.
*   **Developers:** To understand the technical tasks, architecture, and implementation details for each feature.

---

## 3. Development Phases & Milestones

### Phase 0: Project Setup & Foundation
**Milestone:** A stable and documented development environment for all team members.

*   **Epic: Configure Development Environments**
    *   **Task 1 (DBA/Lead Dev):** Finalize NeonDB instance setup. Securely store and distribute connection credentials to the team.
    *   **Task 2 (Backend Dev):** Create a template Google Colab notebook (`backend/notebooks/template.ipynb`). This notebook should contain boilerplate code for connecting to NeonDB and loading environment variables.
    *   **Task 3 (Lead Dev):** Fully document the end-to-end setup process in `docs/setup_guide.md`, covering NeonDB connection, Colab environment, and local frontend setup.
    *   **Task 4 (Frontend Dev):** Initialize the React application in the `frontend/` directory using `create-react-app` or Vite. Establish the basic project structure (components, pages, services).

### Phase 1: Core Sales & Profit Tracking
**Milestone:** A functional MVP backend that can record sales and calculate profits.

*   **Epic: Database Schema Implementation**
    *   **Task 1 (DBA/Backend Dev):** Finalize the core schema in `database/schema.sql`. It must include tables for `products`, `sales`, and `sale_items`, with appropriate columns for pricing, costs, and timestamps.
    *   **Task 2 (Backend Dev):** Develop a script or a Colab notebook (`database/schema_apply.ipynb`) to execute the `schema.sql` against the NeonDB instance idempotently.
    *   **Task 3 (Backend Dev):** Populate `database/seed_data.sql` with realistic sample data for at least 10-15 products and a handful of sales transactions for robust testing.
    *   **Task 4 (Backend Dev):** Create a Colab notebook (`database/seed_run.ipynb`) to execute the seeding script.

*   **Epic: Backend API for Sales Tracking (Colab-First Prototyping)**
    *   **Task 1 (Backend Dev):** In a new Colab notebook (`backend/notebooks/sales_logic_prototype.ipynb`), develop and test the core business logic in Python:
        *   Function to record a new sale, updating all relevant tables.
        *   Function to calculate total sales revenue over a given period (daily, weekly, monthly).
        *   Function to calculate profit margins per product and per sale.
    *   **Task 2 (Backend Dev):** Port the validated logic from the notebook into the Flask/FastAPI application in `backend/api/`. Structure the code into models, services, and routes.
    *   **Task 3 (Backend Dev):** Implement the following RESTful API endpoints:
        *   `POST /sales`: Records a new sale transaction.
        *   `GET /sales/summary?period=daily`: Retrieves aggregated sales data.
        *   `GET /products/{product_id}/profit`: Calculates profit for a specific product.
    *   **Task 4 (Backend Dev):** Write unit tests in `backend/tests/test_api.py` to ensure the sales endpoints are working correctly.

### Phase 2: Inventory Management
**Milestone:** The backend is extended to support full inventory tracking and analysis.

*   **Epic: Enhance Database for Inventory**
    *   **Task 1 (DBA/Backend Dev):** Update `database/schema.sql` to include inventory tracking. This could be a new `inventory` table or by adding `quantity_on_hand` and `reorder_level` columns to the `products` table.
    *   **Task 2 (Backend Dev):** Update `database/seed_data.sql` to include initial stock levels for all products.

*   **Epic: Backend API for Inventory (Colab-First Prototyping)**
    *   **Task 1 (Backend Dev):** In a new notebook (`backend/notebooks/inventory_logic_prototype.ipynb`), develop and test Python functions for:
        *   Identifying fast-moving vs. slow-moving products based on sales data.
        *   Generating a list of products that have fallen below their `reorder_level`.
        *   Decrementing stock levels automatically when a sale is made.
    *   **Task 2 (Backend Dev):** Port the stable inventory logic into the `backend/api/` application.
    *   **Task 3 (Backend Dev):** Implement the following API endpoints:
        *   `GET /inventory/status`: Returns current stock levels for all products.
        *   `GET /inventory/alerts`: Returns a list of products needing reordering.
        *   `GET /analytics/product_velocity`: Ranks products by sales volume.
    *   **Task 4 (Backend Dev):** Write corresponding unit tests for the new inventory endpoints.

### Phase 3: Frontend Dashboard Development
**Milestone:** A responsive user interface for viewing data and interacting with the system.

*   **Epic: UI/UX Design & Component Library**
    *   **Task 1 (Frontend Dev/Designer):** Create wireframes for the main dashboard, sales reporting view, and inventory management page.
    *   **Task 2 (Frontend Dev):** Select and integrate a UI component library like Material-UI or Ant Design to ensure a consistent look and feel.
    *   **Task 3 (Frontend Dev):** Develop a library of reusable components in `frontend/src/components/` (e.g., `StatCard`, `SalesChart`, `DataTable`).

*   **Epic: Frontend Implementation & API Integration**
    *   **Task 1 (Frontend Dev):** Create a robust API service layer in `frontend/src/services/` to handle all communication with the backend.
    *   **Task 2 (Frontend Dev):** Build the main dashboard page (`frontend/src/pages/Dashboard.js`) to display key sales summaries and charts.
    *   **Task 3 (Frontend Dev):** Build the inventory management page to display stock levels, highlight alerts, and show product velocity.
    *   **Task 4 (Frontend Dev):** Create a sales entry form/page to allow users to record new sales transactions.

### Phase 4: Advanced Features & Polish
**Milestone:** The application is enhanced with analytics, user roles, and is ready for pre-production testing.

*   **Epic: Analytics Dashboard**
    *   **Task 1 (Frontend Dev):** Integrate a charting library (e.g., Chart.js or Recharts) into the frontend.
    *   **Task 2 (Frontend Dev):** Create interactive charts and visualizations for sales trends, profit margins, and inventory turnover.

*   **Epic: Multi-User Support (Authentication & Authorization)**
    *   **Task 1 (Backend Dev):** Update the database schema to include `users` and `roles` tables (`manager`, `cashier`).
    *   **Task 2 (Backend Dev):** Implement JWT-based authentication in the backend. Create `login` and `register` endpoints.
    *   **Task 3 (Backend Dev):** Implement role-based access control (RBAC) to restrict access to certain endpoints (e.g., only managers can see profit reports).
    *   **Task 4 (Frontend Dev):** Add login/logout flows and protected routes to the frontend application.

### Phase 5: Deployment & Operations
**Milestone:** The application is deployed and accessible to users.

*   **Epic: CI/CD & Deployment**
    *   **Task 1 (DevOps/Lead Dev):** Set up a GitHub Actions workflow to automatically run backend tests on every push to `main`.
    *   **Task 2 (DevOps/Lead Dev):** Write a `Dockerfile` to containerize the backend API.
    *   **Task 3 (DevOps/Lead Dev):** Select hosting platforms (e.g., Vercel for frontend, Render/Heroku for backend) and create deployment pipelines.
    *   **Task 4 (DevOps/Lead Dev):** Document the full deployment and rollback process.
