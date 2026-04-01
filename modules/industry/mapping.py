INDUSTRY_MAP = {
    "phần mềm": "IT",
    "công nghệ thông tin": "IT",
    "bán buôn": "RETAIL",
    "logistics": "LOGISTICS"
}

def normalize(industry_raw: str):
    for key, val in INDUSTRY_MAP.items():
        if key in industry_raw.lower():
            return val
    return "OTHER"