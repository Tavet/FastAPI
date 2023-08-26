from sqlalchemy.orm import Session
from sqlalchemy import func
import models

def get_top_currency(db: Session, symbol: str):
    return db.query(models.User.username,
                    models.User.email,
                    func.max(models.UserAsset.quantity).label('quantity')
                    ).join(models.User, models.User.id == models.UserAsset.user_id
                           ).join(models.Asset, models.Asset.id == models.UserAsset.asset_id
                                  ).filter(models.Asset.symbol == symbol
                                           ).group_by(
                                               models.User.username, models.User.email, models.UserAsset.quantity
                                           ).limit(2)
