def predict_jobs(industry: str):
    if industry == "IT":
        return {"backend": 0.9, "frontend": 0.8}
    if industry == "LOGISTICS":
        return {"supply_chain": 0.7, "backend": 0.3}
    return {}