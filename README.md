# Scout 🎯

**Scout** is a Counter-Strike 2 scouting and analytics tool designed to help identify player and team performance trends using parsed match data and ML-driven insights.

## 📦 Project Structure

- `scout.data/`: Python backend for retrieving championship data from the FACEIT API, and eventually for parsing demos and generating match-level features.
- `scout.api/` *(planned)*: Rust backend to serve API endpoints for the frontend and authenticated clients.
- `frontend/` *(planned)*: React-based dashboard for browsing teams, matches, and statistics.
- `database/`: SQL schema for the relational database used to store parsed match data (championships, matches, players, teams, etc.).

## 🧠 Key Components

- Championship scanning from FACEIT's public API
- Planned demo parsing and feature extraction (Python)
- Planned Rust API for frontend clients and authenticated endpoints
- Modular monorepo structure with isolated service responsibilities

## 🗃️ Database

PostgreSQL-based schema featuring:
- `championship`, `match`, `game`, `team`, `player`, `game_player_stats`, etc.
- Normalized design for efficient querying and stat aggregation

## 🚧 Current Status

- ✅ FACEIT API integration to fetch and filter active CS2 championships
- 🔜 Demo parsing and ML modeling (Python)
- 🔜 API scaffolding (Rust)
- 🔜 Web frontend (React)

## 🧰 Technologies

- Python (data retrieval, ML pipelines)
- PostgreSQL (relational database)
- Rust (planned: high-performance API)
- React (planned: frontend dashboard)

## 📝 License

MIT License