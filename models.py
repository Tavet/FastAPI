from sqlalchemy import Boolean, Column, ForeignKey, Integer, String, Numeric
from sqlalchemy.orm import relationship

from database import Base


class User(Base):
    __tablename__ = "users"
    id = Column(Integer, primary_key=True, index=True)
    username = Column(String)
    email = Column(String)
    password_hash = Column(String)
    created_at = Column(String)
    assets = relationship("UserAsset", back_populates="user")
    
class Asset(Base):
    __tablename__ = "assets"
    id = Column(Integer, primary_key=True, index=True)
    symbol = Column(String)
    name = Column(String)
    users = relationship('UserAsset', back_populates="asset")
    
class UserAsset(Base):
    __tablename__ = "user_assets"
    user_id = Column(Integer, ForeignKey('users.id'), primary_key=True)
    asset_id = Column(Integer, ForeignKey('assets.id'), primary_key=True)
    order_type = Column(String)
    quantity = Column(Numeric)
    price = Column(Numeric)
    status = Column(String)
    created_at = Column(String)
    updated_at = Column(String)
    
    user = relationship("User", back_populates="assets")
    asset = relationship("Asset", back_populates="users")