from sqlalchemy import Column, String, Integer

class Company(Base):
    __tablename__ = "companies"

    id = Column(Integer, primary_key=True)
    name = Column(String)
    city = Column(String)
    industry_raw = Column(String)
    industry_normalized = Column(String)