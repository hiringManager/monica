# MONICA-CRM.md

## How to setup your D&D CRM based on Monica

### 1️⃣ Fork Monica

Go to: https://github.com/monicahq/monica → click **Fork** → name it `monica-crm`

### 2️⃣ Clone fork into codex-root/monica-crm/

```bash
git clone https://github.com/YOURUSER/monica-crm.git monica-crm
```

### 3️⃣ Apply CRM patches

Copy files from `monica-crm-patches/`:

- Models: `app/Models/Company.php`, `Deal.php`
- Controllers: `app/Http/Controllers/CompanyController.php`, `DealController.php`
- Migrations: `database/migrations/...`

Run:

```bash
docker compose exec monica php artisan migrate
```

### 4️⃣ Run Monica CRM

```bash
docker compose up --build
```

Access at: http://localhost:8082

### 5️⃣ Customize

You can extend:

- Company → add address, industry, notes
- Deal → add stage, value, close date
- API → integrate with Zapier, other tools

---

Enjoy your modern Git-friendly CRM! 🚀
