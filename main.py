from typing import Union
from fastapi import FastAPI, Depends, HTTPException
from pydantic import BaseModel
from sqlalchemy.orm import Session
import models, query, schemas
from database import SessionLocal, engine

models.Base.metadata.create_all(bind=engine)

app = FastAPI()

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

class Item(BaseModel):
    name: str
    price: float
    is_offer: Union[bool, None] = None


@app.get("/top", response_model=list[schemas.TopAssets])
def read_users(symbol:str = 'ETH', db: Session = Depends(get_db)):
    users = query.get_top_currency(db, symbol)
    return users
