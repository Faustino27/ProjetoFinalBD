from fastapi import APIRouter, Depends
from models.user import tipoAtaques
from config.db import conn
from schemas.classes import TipoAtaque
tataque = APIRouter(
    prefix = "/tipos",
    tags =["tipos"],
    #responses = {404: {"Description": "Not found"}}

)

@tataque.get('/')
async def Lista_Tipos():
    return conn.execute(tipoAtaques.select()).fetchall()
@tataque.get('/{Codigo}')
async def Find_Tipo(codigo: int):
    return conn.execute(tipoAtaques.select().where(tipoAtaques.c.Codigo == codigo)).first()
@tataque.post('/')
async def create_Tipo(tpAtaque:  TipoAtaque):
    conn.execute(tipoAtaques.insert().values(
        Codigo = tpAtaque.codigo,
        Informacoes = tpAtaque.info,
        Infra_ou_Web = tpAtaque.infra, 
    ))
    return conn.execute(tipoAtaques.select()).fetchall
@tataque.put('/{Codigo}')
async def update_Tipo(codigo: str, tpAtaque: TipoAtaque):
    return conn.execute(tipoAtaques.update().values(
        Codigo = tpAtaque.codigo,
        Informacoes = tpAtaque.info,
        Infra_ou_Web = tpAtaque.infra, 
    ).where(tipoAtaques.c.Codigo == codigo))
@tataque.delete('/{Codigo}')
async def fetch_Tipo(codigo: str):
    conn.execute(tipoAtaques.delete().where(tipoAtaques.c.Codigo == codigo))
    return conn.execute(tipoAtaques.select()).fetchall