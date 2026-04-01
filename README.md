# job-predictor

City-based Job Predictor

<!-- job-predictor/
│
├── apps/
│   ├── api/                  # FastAPI app (serve client)
│   ├── worker/               # background jobs (crawl + processing)
│
├── core/
│   ├── config/               # config chung
│   ├── database/             # DB connection, base model
│   ├── logging/              # logging setup
│
├── modules/
│   ├── company/
│   │   ├── models.py
│   │   ├── repository.py
│   │   ├── service.py
│   │
│   ├── industry/
│   │   ├── mapping.py        # normalize ngành
│   │
│   ├── prediction/
│   │   ├── rules.py
│   │   ├── scoring.py
│   │   ├── service.py
│   │
│   ├── crawler/
│   │   ├── sources/
│   │   │   ├── masothue.py
│   │   │   ├── gov.py
│   │   ├── pipeline.py
│
├── scripts/
│   ├── seed_data.py
│   ├── run_crawler.py
│
├── tests/
│
├── .env
├── docker-compose.yml
├── requirements.txt
└── README.md -->
