from fastapi import APIRouter, Depends
from models.user import ataques
from config.db import conn
from schemas.classes import Ataque
from sqlalchemy.schema import Table, MetaData
ataque = APIRouter(
    prefix = "/ataques",
    tags =["ataques"],
    responses = {404: {"Description": "Not found"}}

)
#table = Table(ataques, MetaData(), autoload_with=conn)

@ataque.get('/')
async def Lista_ataques():
    return conn.execute(ataques.select()).fetchall()
@ataque.get('/{Nome}')
async def find_ataque(nome: str):
    return conn.execute(ataques.select().where(ataques.c.Nome == nome)).first()
@ataque.post('/')
async def create_ataque(ataque : Ataque):
    conn.execute(ataques.insert().values(
        Nome = ataque.nome,
        CVSS_CVE = ataque.CVSS,
        Porta_Destino = ataque.Porta,
        Tipo_de_Ataque_Codigo = ataque.Tipo
    ))
    return conn.execute(ataques.select()).fetchall
@ataque.put('/{Nome}')
async def update_ataque(nome: str, ataque: Ataque):
    return conn.execute(ataques.update().values(
        Nome = ataque.nome,
        CVSS_CVE = ataque.CVSS,
        Porta_Destino = ataque.Porta,
        Tipo_de_Ataque_Codigo = ataque.Tipo
    ).where(ataques.c.Nome == nome))
@ataque.delete('/{Nome}')
async def delete_ataque(nome: str):
    conn.execute(ataques.delete().where(ataques.c.Nome == nome))
    return conn.execute(ataques.select()).fetchall