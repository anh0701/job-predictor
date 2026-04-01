def run_pipeline():
    data = crawl_source()

    for item in data:
        item["industry_normalized"] = normalize(item["industry_raw"])
        save_to_db(item)