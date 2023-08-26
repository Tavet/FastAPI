from pydantic import BaseModel

class TopAssets(BaseModel):
    username: str
    email: str
    quantity: float