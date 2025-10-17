# 🍷 Wines & Spirits Sales Tracker

## 📘 Overview
The **Wines & Spirits Sales Tracker** is a full-stack system designed to help liquor store owners track sales, monitor inventory, and analyze profits in real-time.
It provides clear insights into:
- Daily, weekly, and monthly sales
- Profit margins
- Fast-moving vs. slow-moving products
- Stock alerts and reorder suggestions

This project is currently in **development phase**, with the goal of delivering a scalable, cloud-connected retail analytics system.

---

## 🏗️ System Architecture

The project uses a **modular, cloud-based architecture** for flexibility and team collaboration:

🌐 NeonDB (PostgreSQL)
            ┃
            ┣━━📓 Google Colab (Backend Dev Runtime)
            ┃     ┗→ Connects to NeonDB for queries & API logic
            ┃
            ┣━━💾 GitHub (Source Control)
            ┃     ┗→ Stores all backend, frontend, and documentation
            ┃
            ┣━━💻 Local Frontend (UI Development)
            ┃     ┗→ Built in React or Flutter, connected to API
            ┃
            ┗━━⚙️ GitHub Codespaces (Full Cloud Dev Environment)
                  ┗→ Runs backend + frontend for integrated testing

---

## 🧱 Repository Structure

wines-spirits-sales/ │ ├── backend/ │   ├── notebooks/                 # Google Colab notebooks for backend dev │   ├── api/                       # Flask or FastAPI app, DB models, config │   ├── tests/                     # Backend test cases │   └── README.md │ ├── frontend/ │   ├── public/ │   ├── src/ │   ├── package.json │   └── README.md │ ├── database/ │   ├── schema.sql                 # NeonDB schema (tables, relationships) │   ├── seed_data.sql              # Optional: demo data │   ├── queries.sql                # Common analytics queries │   └── README.md │ ├── docs/ │   ├── system_design.md           # Architecture & flow explanation │   ├── setup_guide.md             # Developer setup guide │   └── roadmap.md                 # Feature roadmap & timeline │ ├── .gitignore ├── README.md                      # This file └── LICENSE                        # (optional)

---

## ⚙️ Technology Stack

| Layer | Technology | Purpose |
|-------|-------------|----------|
| **Database** | NeonDB (PostgreSQL Cloud) | Central data storage |
| **Backend** | Python (Flask / FastAPI) | Business logic & API layer |
| **Frontend** | React (or Flutter) | User interface |
| **Development** | Google Colab + GitHub Codespaces | Cloud-based dev & testing |
| **Version Control** | GitHub | Collaboration & CI/CD |

---

## 🧭 Development Workflow

1. **Database Setup**
   - NeonDB hosts the live PostgreSQL database.
   - Schema lives in `database/schema.sql`.

2. **Backend Development**
   - Develop and test logic in Colab notebooks inside `backend/notebooks/`.
   - Once stable, move code to `backend/api/`.
   - Push updates to GitHub frequently.

3. **Frontend Development**
   - Build the UI locally or in Codespaces under `frontend/`.
   - Use mock APIs during early design, then link to backend endpoints.

4. **Integration & Testing**
   - Use GitHub Codespaces to run both backend and frontend together.
   - Validate NeonDB connections and run analytics queries.

---

## 🧩 Key Features (Planned)

| Phase | Feature | Description |
|--------|----------|-------------|
| **Phase 1** | Daily/Weekly/Monthly Sales Tracker | Aggregate and visualize sales by date |
| **Phase 1** | Profit Calculation | Auto-compute profit margins |
| **Phase 2** | Inventory Movement | Highlight fast and slow-moving products |
| **Phase 2** | Alerts & Reorders | Notify when stock runs low |
| **Phase 3** | Analytics Dashboard | Chart-based insights via Retool or custom UI |
| **Phase 3** | Multi-User Support | Role-based access for cashiers and managers |

---

## 🚀 Setup Guide (Summary)

### Prerequisites
- NeonDB account (PostgreSQL connection string)
- GitHub account
- Google Colab (for backend dev)
- Node.js (for frontend, optional)
- Git (for version control)

### Steps
1. Clone this repository
   ```bash
   git clone https://github.com/abdirizakmohamedkurewa-web/wines-spirits-sales.git

2. Import the database schema to NeonDB


3. Open Colab and connect using your Neon connection URL


4. Run API or notebooks under backend/notebooks/


5. Commit changes to GitHub regularly


6. (Optional) Open the repo in Codespaces for full integration tests




---

🧑‍💻 Contribution Guidelines

Always create a feature branch before committing changes:

git checkout -b feature/<feature-name>

Write descriptive commit messages.

Document all schema changes under /database/README.md.

Keep code modular, readable, and consistent with project naming conventions.

Open a Pull Request (PR) for all new features or bug fixes.



---

🔒 Environment Variables (Example)

Variable	Description

DATABASE_URL	Your NeonDB connection string
API_KEY	(Optional) For third-party integrations
SECRET_KEY	Flask/FastAPI app security token



---

🛣️ Roadmap (High-Level)

[x] Define schema and project architecture

[ ] Build core sales tracking backend (Colab → Neon)

[ ] Develop UI dashboard (React)

[ ] Integrate analytics & charts

[ ] Add authentication

[ ] Deploy production-ready version



---

🧾 License

This project is currently private during development.
All rights reserved to the project owner(s).
A suitable open-source license may be added later.


---

Maintained by:

> Project Lead: abdirizakmohamedkurewa-web
Architecture: NeonDB + Colab + Codespaces
Repository: https://github.com/abdirizakmohamedkurewa-web/wines-spirits-sales




---

“Track smarter. Sell better. Grow faster.”

---