def adjust_score(base_score, company_size):
    if company_size and company_size > 100:
        return base_score + 0.1
    return base_score