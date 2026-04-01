class CompanyService:
    def __init__(self, repo):
        self.repo = repo

    def list_companies(self, db, city):
        return self.repo.get_by_city(db, city)