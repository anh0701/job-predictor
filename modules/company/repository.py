class CompanyRepository:
    def get_by_city(self, db, city: str):
        return db.query(Company).filter(Company.city == city).all()