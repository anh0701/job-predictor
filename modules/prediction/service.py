class PredictionService:
    def predict(self, company):
        base = predict_jobs(company.industry_normalized)

        result = {}
        for job, score in base.items():
            result[job] = adjust_score(score, company.size)

        return result